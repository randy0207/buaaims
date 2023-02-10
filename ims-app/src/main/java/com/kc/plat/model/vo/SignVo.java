package com.kc.plat.model.vo;

import lombok.Data;

/**
 * 展示签到信息
 */
@Data
public class SignVo {
    //学院名称
    private String deptName;
    //学院id
    private String deptId;
    //教师id
    private String teacherId;
    //教师姓名
    private String teacherName;
    //签到人数
    private int signCount;
    //签到名称
    private String signName;
    //签到id
    private String signId;
    //签到时间
    private String signTime;
    //已经签到人数
    private int signInCount;
    //课程id
    private String kcId;
    //课程名称
    private String kcName;
    //签到记录id与发布签到id一致
    private String recordId;
    //签到创建时间
    private String signCreateTime;
    //最晚签到时间
    private String signLastTime;
    //状态标签名称
    private String signStatusName;
    //签到范围（米）
    private String sign_distance;

    private String lat;
    private String lon;
    //相差
    private String  distance;
}
