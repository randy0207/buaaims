package com.kc.plat.service.lmp;

import cn.hutool.core.date.DateUtil;
import com.kc.plat.eception.LoginException;
import com.kc.plat.model.*;
import com.kc.plat.service.ApiLoginService;
import com.kc.plat.util.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.DataClassRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.support.JdbcTransactionManager;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.DefaultTransactionAttribute;
import xyz.erupt.core.util.MD5Util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class ApiLoginServiceImp implements ApiLoginService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    //插入多张表时候开始事务
    @Transactional
    public LoginModel register(MiniUserEntity user) {
        check(user);
        DataSourceTransactionManager transactionManager = new JdbcTransactionManager(jdbcTemplate.getDataSource());
        TransactionStatus transaction = transactionManager.getTransaction(new DefaultTransactionAttribute());
        user.setUserId(user.getUsername());
        LoginModel loginModel;
        MiniUserEntity miniUserEntity = getMiniUserEntity(user.getUsername());
        if (miniUserEntity != null) {
            throw new LoginException("用户已存在");
        }
        try {
            if (user.getRegister_type().equals("1")) {
                //插入教师表--多插入一张表
                String insertTeacherSql = "INSERT INTO `teacher`" +
                        " ( `teacher_email`, `teacher_id`, `teacher_name`, `teacher_phone`) VALUES (" +
                        "'%s', '%s', '%s', '%s');";
                String format = String.format(insertTeacherSql, "", user.getUsername(), user.getUsername(), "");
                jdbcTemplate.execute(format);
            } else {
                //插入学生表--多插入一张表
            }

            //插入小程序min_user这张表
            String sql = "INSERT INTO `mini_user` (`dept_id`,`password`, `register_type`," +
                    " `relation_id`, `user_id`, `username`,`nick_name`,`gender`,`grade_id`" +
                    ") VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s');";
            String insertSql = String.format(sql, user.getDept_id(), user.getPassword(),
                    user.getRegister_type(), user.getUsername(),
                    user.getUsername(), user.getUsername(), user.getNick_name(), user.getGender(), user.getGrade_id());
            jdbcTemplate.execute(insertSql);
            //提交事务
            loginModel = createLoginModel(user);
            loginModel.setDeptId(user.getDept_id());
            transactionManager.commit(transaction);
        } catch (Exception e) {
            e.printStackTrace();
            //回滚事务
            transactionManager.rollback(transaction);
            throw new RuntimeException("注册失败");
        }

        return loginModel;
    }

    //检验用户名是否合法
    private void check(MiniUserEntity user) {
        if (StringUtils.isEmpty(user.getGender())) {
            throw new LoginException("性别不能为空");
        }
        if (StringUtils.isEmpty(user.getNick_name())) {
            throw new LoginException("姓名不能为空");
        }
        if (StringUtils.isEmpty(user.getUserId())) {
            throw new LoginException("用户名不能为空");
        }
        if (StringUtils.isEmpty(user.getUsername())) {
            throw new LoginException("用户名不能为空");
        }
        if (StringUtils.isEmpty(user.getPassword())) {
            throw new LoginException("密码不能为空");
        }
        if (StringUtils.isEmpty(user.getDept_id())) {
            throw new LoginException("学院不能为空,没有学院可选请后台添加学院");
        }
        if (user.getUserId().length() < 6) {
            throw new LoginException("用户名长度不能小于6位");
        }
        if (user.getUsername().length() < 6) {
            throw new LoginException("用户名大于6个字符");
        }
        if (user.getPassword().length() < 6) {
            throw new LoginException("密码大于六个字符");
        }
        if (!StringUtil.isChinese(user.getNick_name())) {
            throw new LoginException("姓名必须为中文");
        }
        //简化复杂的判断---满足条件的塞入数组中
        String[] keys = {user.getUserId(), user.getUsername()};
        for (String key : keys) {
            if (StringUtil.isSpecialChar(key) || StringUtil.isChinese(key)) {
                throw new LoginException("用户名不能包含特殊字符或中文");
            }
        }
    }

    /**
     * 创建登录token
     */
    private LoginModel createLoginModel(MiniUserEntity user) {
        String sql = "INSERT INTO `xcx_token` (" +
                "`expire_time`, `token`, `user_id`) VALUES ( '%s', '%s', '%s');";
        String encode = MD5Util.digest(user.getUsername() + user.getPassword());
        //设置时间格式化 yyyy-MM-dd HH:mm:ss
        Date date = new Date();
        //日期加七天
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, 7);
        String dateFormat = DateUtil.format(calendar.getTime(), "yyyy-MM-dd HH:mm:ss");
        String format = String.format(sql, dateFormat, encode, user.getUserId());
        jdbcTemplate.execute(format);
        LoginModel loginModel = new LoginModel();
        loginModel.setMsg("注册成功");
        loginModel.setUserName(user.getUsername());
        loginModel.setToken(encode);
        return loginModel;
    }

    @Override
    public LoginModel login(MiniUserEntity user) {
        MiniUserEntity miniUserEntity = getMiniUserEntity(user.getUsername());
        if (miniUserEntity == null) {
            throw new LoginException("用户不存在");
        }
        XcxTokenEntity xcxTokenEntity = getTokenByUserId(user.getUserId());
        if (xcxTokenEntity == null) {
            return createLoginModel(user);
        }
        LoginModel loginModel = new LoginModel();
        //时间加七天--token是七天过期
        Date date = new Date();
        String expire_time = DateUtil.format(DateUtil.offsetDay(date, 7), "yyyy-MM-dd HH:mm:ss");
        jdbcTemplate.update("UPDATE `xcx_token` SET `expire_time` = '" + expire_time + "' WHERE `user_id` = '" + user.getUserId() + "'");
        loginModel.setMsg("登录成功");
        loginModel.setDeptId(miniUserEntity.getDept_id());
        loginModel.setUserName(user.getUserId());
        loginModel.setToken(xcxTokenEntity.getToken());
        return loginModel;
    }

    private XcxTokenEntity getTokenByUserId(String userId) {
        String sql = "SELECT * FROM `xcx_token` WHERE `user_id` = '%s'";
        String format = String.format(sql, userId);
        List<XcxTokenEntity> list = jdbcTemplate.query(format, new DataClassRowMapper<>(XcxTokenEntity.class));
        XcxTokenEntity xcxTokenEntity = list.size() > 0 ? list.get(0) : null;
        return xcxTokenEntity;
    }

    @Override
    public List<KcDeptEntity> getDeptList(String deptName) {
        String sql = "SELECT * FROM `kc_dept`";
        List<KcDeptEntity> list = jdbcTemplate.query(sql, new DataClassRowMapper<>(KcDeptEntity.class));
        //lambda表达式--过滤内容
        if (!StringUtils.isEmpty(deptName) && !deptName.equals("null")) {
            list = list.stream().filter(kcDeptEntity -> kcDeptEntity.getDept_name().contains(deptName)).collect(Collectors.toList());
        }
        return list;
    }

    @Override
    public List<GradeEntity> getGradeList(String gradeName) {
        String sql = "SELECT *  FROM `grade`";
        List<GradeEntity> list = jdbcTemplate.query(sql, new DataClassRowMapper<>(GradeEntity.class));
        return list;
    }

    private MiniUserEntity getMiniUserEntity(String userId) {
        String sql = "SELECT * FROM `mini_user` WHERE `username` = '%s'";
        String format = String.format(sql, userId);
        List<MiniUserEntity> list = jdbcTemplate.query(format, new DataClassRowMapper<>(MiniUserEntity.class));
        return list.size() > 0 ? list.get(0) : null;
    }
}
