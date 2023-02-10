package com.kc.plat.service;

import com.kc.plat.model.GradeEntity;
import com.kc.plat.model.KcDeptEntity;
import com.kc.plat.model.LoginModel;
import com.kc.plat.model.MiniUserEntity;

import java.util.List;

/**
 * 登录线管接口
 */
public interface ApiLoginService {

    /**
     * 注册
     **/
    LoginModel register(MiniUserEntity user);

    /**
     * 登录
     */
    LoginModel login(MiniUserEntity user);

    /**
     * 获取学院列表
     * */
    List<KcDeptEntity> getDeptList(String deptName);

    List<GradeEntity> getGradeList(String gradeName);

}
