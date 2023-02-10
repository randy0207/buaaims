package com.kc.plat.controller;

import com.kc.plat.common.R;
import com.kc.plat.model.TotalParamModel;
import com.kc.plat.service.TotalSignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * 统计控制器
 */
@RestController
@RequestMapping("/total")
public class TotalController {

    @Autowired
    private TotalSignService totalSignService;


    @PostMapping("/totalSign")
    public R getNoSignCount(@RequestBody TotalParamModel totalParamModel) {
        return R.ok(totalSignService.totalSign(totalParamModel));
    }


    @PostMapping("/getTotalSignList")
    public R getNoSignList(@RequestBody TotalParamModel totalParamModel) {
        return R.ok(totalSignService.getTotalSignList(totalParamModel));
    }

}
