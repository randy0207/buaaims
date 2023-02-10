package com.kc.plat.service.lmp;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.RandomUtil;
import com.kc.plat.eception.SignException;
import com.kc.plat.model.*;
import com.kc.plat.model.vo.SignCourseParam;
import com.kc.plat.model.vo.SignTotalVo;
import com.kc.plat.model.vo.SignVo;
import com.kc.plat.service.ApiSignService;
import com.kc.plat.util.DistanceUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.DataClassRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.support.JdbcTransactionManager;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.interceptor.DefaultTransactionAttribute;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class ApiSignServiceImp implements ApiSignService {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    //正常签到
    private final static String SIGN_STATUS = "1";
    //迟到签到
    private final static String SIGN_STATUS_TIME = "2";

    @Override
    public void sign(SignModel signModel) {
        String status = "";
        KcSignPublishEntity singPublish = getSingPublish(signModel);
        if (singPublish == null) {
            throw new SignException("没有发布签到记录，请发布签到信息");
        }

        SignRecordEntity signRecordEntity = getSignRecordEntity(signModel.getStudentId(), signModel.getSignId());
        if (signRecordEntity != null) {
            //已经签到过
            throw new SignException("已经签到过");
        }
        //判断签到时间是否在签到时间段内
        if (new Date().getTime() < singPublish.getSign_time().getTime()) {
            throw new SignException("签到时间还未到");
        }
        //判断是否迟到
        if (new Date().getTime() < singPublish.getSign_last_time().getTime()) {
            status = SIGN_STATUS;
        } else {
            //迟到
            status = SIGN_STATUS_TIME;
        }
        checkDistance(singPublish, signModel.getLat(), signModel.getLon());
        DataSourceTransactionManager transactionManager = new JdbcTransactionManager(jdbcTemplate.getDataSource());
        TransactionStatus transaction = transactionManager.getTransaction(new DefaultTransactionAttribute());
        try {
            //签到--插入数据到签到记录表中
            String sql = "" +
                    "INSERT INTO sign_record (" +
                    "record_id,lat,lon,sign_create_time,sign_publish_id,stu_id" +
                    ",sign_status" +
                    ") VALUES ('%s','%s','%s','%s','%s','%s','%s')";
            //new Date()时间格式化为 yyyy-MM-dd HH:mm:ss
            String dateFormat = DateUtil.format(new Date(), "yyyy-MM-dd HH:mm:ss");
            String format = String.format(sql, RandomUtil.randomInt(5) + System.currentTimeMillis(), signModel.getLat(), signModel.getLon(), dateFormat, signModel.getSignId(),
                    signModel.getStudentId(), status);
            jdbcTemplate.execute(format);
            //更新签到次数
            String sql1 = "UPDATE kc_sign_puplish SET has_sign_num = '%s' WHERE sign_id = '%s'";
            int num;
            if (StringUtils.isEmpty(singPublish.getHas_sign_num())) {
                num = 1;
            } else {
                num = Integer.parseInt(singPublish.getHas_sign_num()) + 1;
            }
            singPublish.setHas_sign_num(num + "");
            String format1 = String.format(sql1, singPublish.getHas_sign_num(), signModel.getSignId());
            jdbcTemplate.execute(format1);
            transactionManager.commit(transaction);
        } catch (DataAccessException e) {
            transactionManager.rollback(transaction);
            throw new SignException("签到失败", e);
        }
    }

    /**
     * 计算距离是否满足签到距离
     */
    private void checkDistance(KcSignPublishEntity distance, String lat, String lon) {
        //经纬度两点计算距离
        Double lat1 = Double.parseDouble(lat);
        Double lng1 = Double.parseDouble(lon);
        Double lat2 = Double.parseDouble(distance.getLat());
        Double lng2 = Double.parseDouble(distance.getLon());
        double distance1 = DistanceUtil.getDistance(lat1, lng1, lat2, lng2);
        if (distance1 > distance.getSign_distance()) {
            throw new SignException("距离太远,不能签到");
        }
    }

    private KcSignPublishEntity getSingPublish(SignModel signModel) {
        String s = "SELECT * FROM kc_sign_puplish WHERE sign_id = '%s'";
        String format = String.format(s, signModel.getSignId());
        List<KcSignPublishEntity> kcSignPublishEntity = jdbcTemplate.query(format, new DataClassRowMapper<>(KcSignPublishEntity.class));
        return kcSignPublishEntity.size() > 0 ? kcSignPublishEntity.get(0) : null;
    }

    @Override
    public List<SignVo> querySign(MiniUserEntity userEntity) {
        MiniUserEntity user = getMiniUserByUserId(userEntity.getUserId());
        //查询自己的签到情况
        String sql = "SELECT\n" +
                "\t\t*\n" +
                "FROM\n" +
                "\t( SELECT * FROM kc_sign_puplish AS a WHERE a.dept_id = '%s' ) t1\n" +
                "\tLEFT JOIN ( SELECT * FROM sign_record AS b WHERE b.stu_id = '%s' ) t2\n" +
                "\t ON t1.sign_id = t2.sign_publish_id\n" +
                "\t LEFT JOIN kc  on kc.kc_id = t1.kc_id\n" +
                "\t LEFT JOIN teacher as a ON  a.teacher_id = t1.teacher_id\n" +
                "\t LEFT JOIN kc_dept as b ON b.dept_id = t1.dept_id\n" +
                " where TO_DAYS(t1.sign_time) = TO_DAYS(NOW()) AND TO_DAYS(t1.sign_last_time) = TO_DAYS(NOW()) AND t1.grade_id = '%s' order by t1.sign_time desc";
        String format = String.format(sql, user.getDept_id(), user.getUserId(), user.getGrade_id());
        List<SignVo> voList = jdbcTemplate.query(format, new DataClassRowMapper<>(SignVo.class));
        return voList;
    }

    @Override
    public List<SignVo> signList(MiniUserEntity userEntity) {
        MiniUserEntity user = getMiniUserByUserId(userEntity.getUserId());
        String sql = "SELECT\n" +
                "\t\t*,t1.lat as lat,t1.lon as lon,t1.sign_distance as sign_distance\n" +
                "FROM\n" +
                "\t( SELECT * FROM kc_sign_puplish AS a WHERE a.dept_id = '%s' ) t1\n" +
                "\tLEFT JOIN ( SELECT * FROM sign_record AS b WHERE b.stu_id = '%s' ) t2\n" +
                "\t ON t1.sign_id = t2.sign_publish_id\n" +
                "\t LEFT JOIN kc  on kc.kc_id = t1.kc_id\n" +
                "\t LEFT JOIN teacher as a ON  a.teacher_id = t1.teacher_id\n" +
                "\t LEFT JOIN kc_dept as b ON b.dept_id = t1.dept_id\n" +
                " where TO_DAYS(t1.sign_time) = TO_DAYS(NOW()) AND TO_DAYS(t1.sign_last_time) = TO_DAYS(NOW()) AND t1.grade_id = '%s' order by t1.sign_time desc";
        String format = String.format(sql, user.getDept_id(), user.getUserId(), user.getGrade_id());
        List<SignVo> voList = jdbcTemplate.query(format, new DataClassRowMapper<>(SignVo.class));
        return voList;
    }

    private MiniUserEntity getMiniUserByUserId(String userId) {
        String sql = "SELECT * FROM mini_user WHERE user_id = '%s'";
        List<MiniUserEntity> query = jdbcTemplate.query(String.format(sql, userId), new DataClassRowMapper<>(MiniUserEntity.class));
        return query.size() > 0 ? query.get(0) : null;
    }

    private SignRecordEntity getSignRecordEntity(String stuId, String signPublishId) {
        String sql = "SELECT * FROM sign_record WHERE stu_id = '%s' AND sign_publish_id = '%s'";
        String format = String.format(sql, stuId, signPublishId);
        List<SignRecordEntity> signRecordEntity = jdbcTemplate.query(format, new DataClassRowMapper<>(SignRecordEntity.class));
        return signRecordEntity.size() > 0 ? signRecordEntity.get(0) : null;
    }

    @Override
    public List<SignTotalVo> totalSign(MiniUserEntity userEntity) {
        MiniUserEntity user = getMiniUserByUserId(userEntity.getUserId());
        String sql = "SELECT\n" +
                "\tCOUNT(if(trim(sign_status)=sign_status,null,1)) AS 'without_sign',\n" +
                "\tCOUNT(1) AS 'sign_total',\n" +
                "\tcount(case when sign_status in ('1') then 1 else null end) as 'normal_sign',\n" +
                "\tcount(case when sign_status in ('2') then 1 else null end) AS 'late_sign',\n" +
                "\tdate_format(t1.sign_time, '%Y-%m-%d') as 'total_date'" +
                "FROM\n" +
                "\t( SELECT * FROM kc_sign_puplish AS a WHERE a.dept_id = " +
                "'" + user.getDept_id() + "'" +
                " ) t1\n" +
                "\tLEFT JOIN ( SELECT * FROM sign_record AS b WHERE b.stu_id = " +
                "'" + user.getUserId() + "'" +
                " ) t2 ON t1.sign_id = t2.sign_publish_id\n" +
                "\tLEFT JOIN kc ON kc.kc_id = t1.kc_id\n" +
                "\tLEFT JOIN teacher AS a ON a.teacher_id = t1.teacher_id\n" +
                "\tLEFT JOIN kc_dept AS b ON b.dept_id = t1.dept_id\n" +
                " where t1.grade_id = " +
                "'" + user.getGrade_id() + "' " +
                "\tGROUP BY  date_format(t1.sign_time, '%Y-%m-%d') ORDER BY t1.sign_time desc";

        List<SignTotalVo> list = jdbcTemplate.query(sql, new DataClassRowMapper<>(SignTotalVo.class));
        return list;
    }

    @Override
    public List<SignVo> getSignCourseList(SignCourseParam param) {
        MiniUserEntity user = getMiniUserByUserId(param.getUserId());
        String sql = "SELECT\n" +
                "*,\n" +
                "CASE WHEN t2.sign_status='1' THEN '正常签到'\n" +
                "WHEN t2.sign_status='2' THEN '迟到'\n" +
                "WHEN t2.sign_status IS NULL  THEN '未签到'\n" +
                " END AS 'sign_status_name'\n" +
                "FROM\n" +
                "\t( SELECT * FROM kc_sign_puplish AS a WHERE a.dept_id = '%s' ) t1\n" +
                "\tLEFT JOIN ( SELECT * FROM sign_record AS b WHERE b.stu_id = '%s' ) t2 ON t1.sign_id = t2.sign_publish_id\n" +
                "\tLEFT JOIN kc ON kc.kc_id = t1.kc_id\n" +
                "\tLEFT JOIN teacher AS a ON a.teacher_id = t1.teacher_id\n" +
                "\tLEFT JOIN kc_dept AS b ON b.dept_id = t1.dept_id\n" +
                "\tWHERE  t1.sign_time BETWEEN  '%s 00:00:00'  and  '%s 23:59:59' and t1.grade_id = '%s'\n  order by t1.sign_time desc";
        String date = DateUtil.format(DateUtil.parse(param.getSignDate()), "yyyy-MM-dd");
        String format = String.format(sql, param.getDeptId(), param.getUserId(), date, date, user.getGrade_id());
        List<SignVo> list = jdbcTemplate.query(format, new DataClassRowMapper<>(SignVo.class));
        return list;
    }
}
