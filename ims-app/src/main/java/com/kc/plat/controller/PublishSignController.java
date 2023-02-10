package com.kc.plat.controller;

import com.kc.plat.common.R;

import com.kc.plat.model.KcSignPublishEntity;
import com.kc.plat.model.KvEntity;
import com.kc.plat.model.PageHelper;
import com.kc.plat.service.PublishSignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/publishSign")
public class PublishSignController {

    @Autowired
    private PublishSignService publishSignService;

    /**
     * 发布签到信息
     **/
    @PostMapping("/publish")
    R publishSign(@RequestBody KcSignPublishEntity publishEntity) {
        KcSignPublishEntity publish;
        try {
            publish  = publishSignService.publishSign(publishEntity);
        } catch (Exception e) {
           return R.error(e.getMessage());
        }
        return R.ok(publish);
    }

    /**
     * 修改发布签到信息
     **/
    @GetMapping("/getPublishSignById/{id}")
    R getPublishSignById(@PathVariable(name = "id") String id) {
        KcSignPublishEntity signPublishEntity = publishSignService.getPublishSignById(Long.parseLong(id));
        return R.ok(signPublishEntity);
    }

    /**
     * 修改发布签到信息
     **/
    @PostMapping("/updatePublishSign")
    R updatePublishSign(@RequestBody KcSignPublishEntity publishEntity) {
        int count = 0;
        try {
            count = publishSignService.updatePublishSign(publishEntity);
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
        return R.ok(count);
    }

    /**
     * 删除发布签到信息
     **/
    @DeleteMapping("/delPublishSign/{ids}")
    R delPublishSign(@PathVariable("ids") String ids) {
        int count = publishSignService.delsPublishSign(ids);
        return R.ok(count);
    }

    @PostMapping("/getPublishSignList")
    public R getPublishSignList(@RequestBody PageHelper pageHelper) {
        PageHelper helper = publishSignService.getPublishSignList(pageHelper);
        return R.ok(helper);
    }

    /**
     * 获取老师列表
     **/
    @GetMapping("/teacherList")
    R getTeacherList() {
        return R.ok(publishSignService.getTeacherList());
    }

    /**
     * 获取学院列表
     **/
    @GetMapping("/deptList")
    R getDeptList() {
        return R.ok(publishSignService.getDeptList());
    }


    /**
     * 获取签到信息
     **/
    @GetMapping("/getKcList")
    R getKcList() {
        return R.ok(publishSignService.getKcList());
    }

    /**
     * 获取签到信息
     **/
    @GetMapping("/getGradeList")
    R getGradeList() {
        List<KvEntity> list = publishSignService.getGradeList();
        return R.ok(list);
    }
}
