package com.kc.plat.model;

import lombok.Data;

/**
 * 统计参数
 * 目前支持以下参数统计
 */
@Data
public class TotalParamModel {
    //签到日期
    private String signDate;
    //签到userId
    private String userId;
    //学院
    private String deptId;
    //班级
    private String gradeId;
}
