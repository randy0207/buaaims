package com.kc.plat.service;

import com.kc.plat.model.*;

import java.util.List;

/**
 * 发布签到信息
 */
public interface PublishSignService {


    /**
     * 获取签到列表
     **/
    PageHelper getPublishSignList(PageHelper pageHelper);

    /**
     * 发布签到信息
     **/
    KcSignPublishEntity publishSign(KcSignPublishEntity publishEntity);


    /**
     * 获取老师列表
     **/
    List<KvEntity> getTeacherList();

    /**
     * 获取学院列表
     **/
    List<KvEntity> getDeptList();


    /**
     * 获取签到信息
     **/
    List<KvEntity> getKcList();

    KcSignPublishEntity getPublishSignById(Long id);

    int updatePublishSign(KcSignPublishEntity publishEntity);

    int delsPublishSign(String ids);

    List<KvEntity> getGradeList();
}
