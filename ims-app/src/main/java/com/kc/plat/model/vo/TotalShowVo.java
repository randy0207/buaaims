package com.kc.plat.model.vo;

import lombok.Data;


/**
 * 统计后台展示
 */
@Data
public class TotalShowVo {
    //学院名称
    private String deptName;
    //年级
    private String gradeName;
    //课程
    private String kcName;
    //学生姓名
    private String stuName;
}
