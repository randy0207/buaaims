package com.kc.plat.util;

import com.kc.plat.model.KcDeptEntity;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class DbUtil<T> {

    private T t;

    public DbUtil(T t, JdbcTemplate jdbcTemplate) {
        this.t = t;
        this.jdbcTemplate = jdbcTemplate;
    }


    private JdbcTemplate jdbcTemplate;

    public <T> T query(Class<T> clazz, String sql) {
        if (clazz == List.class) {

        } else if (clazz == t.getClass()) {
            System.out.println("");
        }
        return null;
    }

    public static void main(String[] args) {
        DbUtil<KcDeptEntity> dbUtil = new DbUtil<>(new KcDeptEntity(), null);

        List<KcDeptEntity> query = dbUtil.query(List.class, "select * from kc_dept");
        KcDeptEntity query1 = dbUtil.query(KcDeptEntity.class, "select * from kc_dept");
        System.out.println(query);
    }
}
