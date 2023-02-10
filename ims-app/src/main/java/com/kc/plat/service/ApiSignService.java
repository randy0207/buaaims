package com.kc.plat.service;

import com.kc.plat.model.*;
import com.kc.plat.model.vo.SignCourseParam;
import com.kc.plat.model.vo.SignTotalVo;
import com.kc.plat.model.vo.SignVo;

import java.util.List;

/**
 * 签到相关接口
 **/
public interface ApiSignService {


    /**
     * 签到
     */
    void sign(SignModel signModel);

    /**
     * 查询签到记录
     */
    List<SignVo> querySign(MiniUserEntity userEntity);

    List<SignVo> signList(MiniUserEntity userEntity);

    /**
     * 统计考勤情况
     */
    List<SignTotalVo> totalSign(MiniUserEntity userEntity);
    /**
     *   获取自己的签到的课程列表（包含未签到的）
     */
    List<SignVo> getSignCourseList(SignCourseParam param);
}
