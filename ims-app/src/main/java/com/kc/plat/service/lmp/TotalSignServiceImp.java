package com.kc.plat.service.lmp;

import com.kc.plat.model.TotalParamModel;
import com.kc.plat.model.vo.TotalShowVo;
import com.kc.plat.service.TotalSignService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.DataClassRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class TotalSignServiceImp implements TotalSignService {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    @Override
    public Map<String, String> totalSign(TotalParamModel totalParamModel) {
        String sql = "SELECT\n" +
                "sum(pb.must_sign_num-pb.has_sign_num) as 'no_sign_count',\n" +
                "sum(pb.must_sign_num) as 'must_sign_num',\n" +
                "sum(pb.has_sign_num) as 'has_sign_num'\n" +
                "FROM\n" +
                "\tkc_sign_puplish AS pb";
        String appendConditionSql = appendCondition(sql, totalParamModel);
        Map<String, String> query = jdbcTemplate.query(appendConditionSql, res -> {
            Map<String, String> map = new HashMap<>();
            while (res.next()) {
                map.put("no_sign_count", res.getString("no_sign_count"));
                map.put("must_sign_num", res.getString("must_sign_num"));
                map.put("has_sign_num", res.getString("has_sign_num"));
                return map;
            }
            return null;
        });
        return query;
    }

    @Override
    public Map<String, Object> getTotalSignList(TotalParamModel totalParamModel) {
        Map<String, Object> map = new HashMap<>();
        List<Map<String, String>> query = getSignRecordList(totalParamModel);
        List<Map<String, String>> list = getSignLateRecordList(totalParamModel);
        List<Map<String, String>> list1 = getSignNormalRecordList(totalParamModel);
        map.put("signRecordList", query != null ? query : new ArrayList<>());
        map.put("signLateRecordList", list != null ? list : list1);
        map.put("signNormalRecordList", list1 != null ? list1 : new ArrayList<>());
        return map;
    }

    private List<Map<String, String>> getSignNormalRecordList(TotalParamModel totalParamModel) {
        String sql = "SELECT\n" +
                "\tgrade.grade_name as grade_name,\n" +
                "\tpb.sign_name as sign_name,\n" +
                "\tth.teacher_name as teacher_name,\n" +
                "\tkc.kc_name as kc_name,\n" +
                "\tdept_name as dept_name,\n" +
                "\tus.nick_name as nick_name,\n" +
                "\trc.sign_create_time as sign_create_time,\n" +
                "\tpb.sign_time as sign_time,\n" +
                "\tpb.sign_last_time as  sign_last_time\n" +
                "FROM\n" +
                "\tsign_record AS rc\n" +
                "\tLEFT JOIN kc_sign_puplish AS pb ON rc.sign_publish_id = pb.sign_id\n" +
                "\tLEFT JOIN teacher AS th ON th.teacher_id = pb.teacher_id\n" +
                "\tLEFT JOIN kc AS kc ON pb.kc_id = pb.kc_id\n" +
                "\tLEFT JOIN kc_dept AS dept ON pb.dept_id = dept.dept_id\n" +
                "\tLEFT JOIN mini_user AS us ON rc.stu_id = us.user_id\n" +
                "\tLEFT JOIN grade AS grade ON pb.grade_id = grade.grade_id\n" +
                "WHERE rc.sign_create_time<pb.sign_last_time ";
        String appendConditionSql = appendCondition(sql, totalParamModel);
        List<Map<String, String>> query = jdbcTemplate.query(appendConditionSql, rs -> {
            List<Map<String, String>> list = new ArrayList<>();
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("grade_name", rs.getString("grade_name"));
                map.put("sign_name", rs.getString("sign_name"));
                map.put("teacher_name", rs.getString("teacher_name"));
                map.put("kc_name", rs.getString("kc_name"));
                map.put("dept_name", rs.getString("dept_name"));
                map.put("nick_name", rs.getString("nick_name"));
                map.put("sign_create_time", rs.getString("sign_create_time"));
                map.put("sign_time", rs.getString("sign_time"));
                map.put("sign_last_time", rs.getString("sign_last_time"));
                list.add(map);
            }
            if (list.size() > 0) {
                return list;
            } else {
                return null;
            }
        });
        return query;
    }

    private List<Map<String, String>> getSignLateRecordList(TotalParamModel totalParamModel) {
        String sql = "SELECT\n" +
                "\tgrade.grade_name as grade_name,\n" +
                "\tpb.sign_name as sign_name,\n" +
                "\tth.teacher_name as teacher_name,\n" +
                "\tkc.kc_name as kc_name,\n" +
                "\tdept_name as dept_name,\n" +
                "\tus.nick_name as nick_name,\n" +
                "\trc.sign_create_time as sign_create_time,\n" +
                "\tpb.sign_time as sign_time,\n" +
                "\tpb.sign_last_time as  sign_last_time\n" +
                "FROM\n" +
                "\tsign_record AS rc\n" +
                "\tLEFT JOIN kc_sign_puplish AS pb ON rc.sign_publish_id = pb.sign_id\n" +
                "\tLEFT JOIN teacher AS th ON th.teacher_id = pb.teacher_id\n" +
                "\tLEFT JOIN kc AS kc ON pb.kc_id = pb.kc_id\n" +
                "\tLEFT JOIN kc_dept AS dept ON pb.dept_id = dept.dept_id\n" +
                "\tLEFT JOIN mini_user AS us ON rc.stu_id = us.user_id\n" +
                "\tLEFT JOIN grade AS grade ON pb.grade_id = grade.grade_id\n" +
                "WHERE pb.sign_last_time<rc.sign_create_time ";
        String appendConditionSql = appendCondition(sql, totalParamModel);
        List<Map<String, String>> query = jdbcTemplate.query(appendConditionSql, rs -> {
            List<Map<String, String>> list = new ArrayList<>();
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("grade_name", rs.getString("grade_name"));
                map.put("sign_name", rs.getString("sign_name"));
                map.put("teacher_name", rs.getString("teacher_name"));
                map.put("kc_name", rs.getString("kc_name"));
                map.put("dept_name", rs.getString("dept_name"));
                map.put("nick_name", rs.getString("nick_name"));
                map.put("sign_create_time", rs.getString("sign_create_time"));
                map.put("sign_time", rs.getString("sign_time"));
                map.put("sign_last_time", rs.getString("sign_last_time"));
                list.add(map);
            }
            if (list.size() > 0) {
                return list;
            } else {
                return null;
            }
        });
        return query;

    }

    private List<Map<String, String>> getSignRecordList(TotalParamModel totalParamModel) {
        String sql = "SELECT\n" +
                "\tgrade.grade_name as grade_name,\n" +
                "\tpb.sign_name as sign_name,\n" +
                "\tth.teacher_name as teacher_name,\n" +
                "\tkc.kc_name as kc_name,\n" +
                "\tdept_name as dept_name,\n" +
                "\tus.nick_name as nick_name,\n" +
                "\trc.sign_create_time as sign_create_time,\n" +
                "\tpb.sign_time as sign_time,\n" +
                "\tpb.sign_last_time as  sign_last_time\n" +
                "FROM\n" +
                "\tsign_record AS rc\n" +
                "\tLEFT JOIN kc_sign_puplish AS pb ON rc.sign_publish_id = pb.sign_id\n" +
                "\tLEFT JOIN teacher AS th ON th.teacher_id = pb.teacher_id\n" +
                "\tLEFT JOIN kc AS kc ON pb.kc_id = pb.kc_id\n" +
                "\tLEFT JOIN kc_dept AS dept ON pb.dept_id = dept.dept_id\n" +
                "\tLEFT JOIN mini_user AS us ON rc.stu_id = us.user_id\n" +
                "\tLEFT JOIN grade AS grade ON pb.grade_id = grade.grade_id where 1=1";
        String appendConditionSql = appendCondition(sql, totalParamModel);
        List<Map<String, String>> query = jdbcTemplate.query(appendConditionSql, rs -> {
            List<Map<String, String>> list = new ArrayList<>();
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("grade_name", rs.getString("grade_name"));
                map.put("sign_name", rs.getString("sign_name"));
                map.put("teacher_name", rs.getString("teacher_name"));
                map.put("kc_name", rs.getString("kc_name"));
                map.put("dept_name", rs.getString("dept_name"));
                map.put("nick_name", rs.getString("nick_name"));
                map.put("sign_create_time", rs.getString("sign_create_time"));
                map.put("sign_time", rs.getString("sign_time"));
                map.put("sign_last_time", rs.getString("sign_last_time"));
                list.add(map);
            }
            if (list.size() > 0) {
                return list;
            } else {
                return null;
            }
        });
        return query;
    }

    /**
     * 把支持条件的数据拼接到sql语句中
     */
    public String appendCondition(String sql, TotalParamModel totalParamModel) {
        StringBuilder sb = new StringBuilder(sql);
        if (!StringUtils.isEmpty(totalParamModel.getUserId())) {
            sb.append(" and rc.stu_id = ").append(totalParamModel.getUserId());
        }
        if (!StringUtils.isEmpty(totalParamModel.getSignDate())) {
            sb.append(" and pb.sign_time = ").append(totalParamModel.getSignDate());
        }
        if (!StringUtils.isEmpty(totalParamModel.getDeptId())) {
            sb.append(" and pb.dept_id = ").append(totalParamModel.getDeptId());
        }
        if (!StringUtils.isEmpty(totalParamModel.getGradeId())) {
            sb.append(" and pb.grade_id = ").append(totalParamModel.getGradeId());
        }
        return sb.toString();
    }
}
