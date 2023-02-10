package com.kc.plat.service;

import com.kc.plat.model.MiniUserEntity;
import com.kc.plat.model.TotalParamModel;
import com.kc.plat.model.vo.TotalShowVo;

import java.util.List;
import java.util.Map;

/**
 * 统计类接口
 */
public interface TotalSignService {


    Map<String, String> totalSign(TotalParamModel totalParamModel);

    /**
     * 查看未签到人数名单----统计注册的，不注册的统计不到
     */
    Map<String, Object> getTotalSignList(TotalParamModel totalParamModel);


}
