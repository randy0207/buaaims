package com.kc.plat.model.vo;

import lombok.Data;

@Data
public class SignCourseParam {
    //学院id
    private String deptId;
    //用户id
    private String userId;
    //签到日期
    private String signDate;
}
