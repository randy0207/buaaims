package com.kc.plat.model;

import lombok.Data;

@Data
public class SignModel {
    //发布的签到Id
    private String signId;
    //学生Id
    private String studentId;
    //维度
    private String lat;
    //经度
    private String lon;
}
