package com.kc.plat.service.lmp;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.RandomUtil;
import com.kc.plat.model.*;
import com.kc.plat.service.PublishSignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.DataClassRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class PublishSignServiceImp implements PublishSignService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public PageHelper getPublishSignList(PageHelper pageHelper) {
        //分页
        Integer start = (pageHelper.getPage() - 1) * pageHelper.getPageSize();
        String sql = "select * from kc_sign_puplish order by sign_time desc limit %s,%s";
        List<KcSignPublishEntity> list = jdbcTemplate.query(String.format(sql, start, pageHelper.getPageSize()), new DataClassRowMapper<>(KcSignPublishEntity.class));
        String countSql = "select count(*) as 'count' from kc_sign_puplish";
        List<CountModel> query = jdbcTemplate.query(countSql, new DataClassRowMapper<>(CountModel.class));
        pageHelper.setList(list);
        pageHelper.setTotal(query.get(0).getCount());
        return pageHelper;
    }

    @Override
    public KcSignPublishEntity publishSign(KcSignPublishEntity publishEntity) {
        checkData(publishEntity);
        String sql = "insert into kc_sign_puplish(dept_id,has_sign_num,kc_id,lat,lon,must_sign_num,sign_distance,sign_id,sign_last_time,sign_name,sign_time,teacher_id,sign_date,address_detail,grade_id) values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')";
        //格式化时间 yyyy-MM-dd HH:mm:ss
        DateTime sign_time = DateUtil.parseCST(publishEntity.getSign_time().toString());
        DateTime sign_last_time = DateUtil.parseCST(publishEntity.getSign_last_time().toString());
        Snowflake snowflake = IdUtil.getSnowflake(1, 1);
        long nextId = snowflake.nextId();
        String format = String.format(sql, publishEntity.getDept_id(), 0, publishEntity.getKc_id(), publishEntity.getLat(), publishEntity.getLon(), publishEntity.getMust_sign_num(), publishEntity.getSign_distance(), nextId, sign_last_time, publishEntity.getSign_name(), sign_time, publishEntity.getTeacher_id(), "", publishEntity.getAddress_detail(), publishEntity.getGrade_id());
        try {
            jdbcTemplate.execute(format);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return publishEntity;
    }

    private void checkData(KcSignPublishEntity publishEntity) {
        if (new Date(String.valueOf(publishEntity.getSign_time())).getTime() > new Date(String.valueOf(publishEntity.getSign_last_time())).getTime()) {
            throw new RuntimeException("结束时间不能小于开始时间");
        }
        //判断时间是否在当日
        if (!DateUtil.format(new Date(), "yyyy-MM-dd").equals(DateUtil.format(publishEntity.getSign_time(), "yyyy-MM-dd"))) {
            throw new RuntimeException("签到时间必须在当日");
        }
        //判断时间是否在当日
        if (!DateUtil.format(new Date(), "yyyy-MM-dd").equals(DateUtil.format(publishEntity.getSign_last_time(), "yyyy-MM-dd"))) {
            throw new RuntimeException("签到时间必须在当日");
        }
    }

    @Override
    public List<KvEntity> getTeacherList() {
        String sql = "select teacher_id as 'value',teacher_name as 'label' from teacher";
        List<KvEntity> list = jdbcTemplate.query(sql, new DataClassRowMapper<>(KvEntity.class));
        return list;
    }

    @Override
    public List<KvEntity> getDeptList() {
        String sql = "select dept_id as 'value', dept_name  as 'label' from kc_dept";
        List<KvEntity> list = jdbcTemplate.query(sql, new DataClassRowMapper<>(KvEntity.class));
        return list;
    }

    @Override
    public List<KvEntity> getKcList() {
        String sql = "select kc_id as 'value',kc_name  as 'label' from kc";
        List<KvEntity> list = jdbcTemplate.query(sql, new DataClassRowMapper<>(KvEntity.class));
        return list;
    }

    @Override
    public KcSignPublishEntity getPublishSignById(Long id) {
        List<KcSignPublishEntity> list = jdbcTemplate.query("select *from kc_sign_puplish where id=?", new DataClassRowMapper<>(KcSignPublishEntity.class), id);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public int updatePublishSign(KcSignPublishEntity publishEntity) {
        checkData(publishEntity);
        DateTime sign_time = DateUtil.parseCST(publishEntity.getSign_time().toString());
        DateTime sign_last_time = DateUtil.parseCST(publishEntity.getSign_last_time().toString());
        String sql = "update kc_sign_puplish set dept_id='%s',has_sign_num=%s,kc_id='%s',lat='%s',lon='%s',must_sign_num=%s,sign_distance=%s,sign_id='%s',sign_last_time='%s',sign_name='%s',sign_time='%s',teacher_id='%s',sign_date='%s',address_detail='%s',grade_id ='%s' where id=%s";
        String format = String.format(sql, publishEntity.getDept_id(), publishEntity.getHas_sign_num(), publishEntity.getKc_id(), publishEntity.getLat(), publishEntity.getLon(), publishEntity.getMust_sign_num(), publishEntity.getSign_distance(), publishEntity.getSign_id(), sign_last_time, publishEntity.getSign_name(), sign_time, publishEntity.getTeacher_id(), publishEntity.getSign_date(), publishEntity.getAddress_detail(), publishEntity.getGrade_id(), publishEntity.getId());
        int update = jdbcTemplate.update(format);
        return update;
    }

    @Override
    public int delsPublishSign(String ids) {
        int del = jdbcTemplate.update("delete from kc_sign_puplish where id in (" + ids + ")");
        return del;
    }

    @Override
    public List<KvEntity> getGradeList() {
        String sql = "select grade_id as 'value',grade_name  as 'label' from grade";
        List<KvEntity> list = jdbcTemplate.query(sql, new DataClassRowMapper<>(KvEntity.class));
        return list;
    }
}
