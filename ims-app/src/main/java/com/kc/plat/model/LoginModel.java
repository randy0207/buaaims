package com.kc.plat.model;

import lombok.Data;

/**
 * 登录注册时候返回一个信息
 */
@Data
public class LoginModel {

    //响应的描述信息
    private String msg;
    //用户名称
    private String userName;
    //响应的token信息
    private String token;
    //学院id
    private String deptId;
}
