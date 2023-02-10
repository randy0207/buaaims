package com.kc.plat.controller;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.kc.plat.annontions.Auth;
import com.kc.plat.common.R;
import com.kc.plat.eception.LoginException;
import com.kc.plat.eception.SignException;
import com.kc.plat.model.*;
import com.kc.plat.model.vo.SignCourseParam;
import com.kc.plat.model.vo.SignTotalVo;
import com.kc.plat.model.vo.SignVo;
import com.kc.plat.service.ApiLoginService;
import com.kc.plat.service.ApiSignService;
import com.kc.plat.util.AddressUntils;
import com.kc.plat.util.BaiduMapGeocode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.ssssssss.magicapi.utils.JsonUtils;

import java.util.List;
import java.util.Map;

/**
 * 统一的api接口
 * 这个地址主要是暴露一个接口，用于访问其他模块的接口
 * URL地址为: http://localhost:8080/api/
 **/
@RestController
@RequestMapping("/api")
public class ApiController {


    @Autowired
    ApiSignService apiSignService;

    @Autowired
    ApiLoginService apiLoginService;

    /**
     * 登录接口
     */
    @RequestMapping("/login")
    public R login(@RequestBody MiniUserEntity user) {
        LoginModel login;
        try {
            login = apiLoginService.login(user);
        } catch (Exception e) {
            if (e instanceof LoginException) {
                return R.error(e.getMessage(), 100003);
            } else {
                return R.error(e.getMessage(), 100002);
            }
        }
        return R.ok(login);
    }

    /**
     * 注册接口
     */
    @RequestMapping("/register")
    public R register(@RequestBody MiniUserEntity user) {
        LoginModel register;
        try {
            register = apiLoginService.register(user);
        } catch (Exception e) {
            return R.error(e.getMessage(), 100002);
        }
        return R.ok(register);
    }

    /**
     * 签到接口
     */
    @PostMapping("/signKc")
    @Auth
    public R sign(@RequestBody SignModel signModel) {
        try {
            apiSignService.sign(signModel);
        } catch (Exception e) {
            if (e instanceof SignException) {
                return R.error(e.getMessage(), 100002);
            } else {
                //打印日志
                e.printStackTrace();
            }
        }
        return R.ok();
    }

    /**
     * 获取签到列表
     */
    @PostMapping("/signList")
    @Auth
    public R signList(@RequestBody MiniUserEntity userEntity) {
        List<SignVo> signList = null;
        try {
            signList = apiSignService.signList(userEntity);
        } catch (Exception e) {
            if (e instanceof SignException) {
                return R.error(e.getMessage(), 100002);
            } else {
                //打印日志
                e.printStackTrace();
            }
        }
        return R.ok(signList);
    }


    /**
     * 查找自己签到记录
     */
    @RequestMapping("/totalSign")
    @Auth
    public R totalSign(@RequestBody MiniUserEntity user) {
        List<SignTotalVo> list = null;
        try {
            list = apiSignService.totalSign(user);
        } catch (Exception e) {
            if (e instanceof SignException) {
                return R.error("查询签到失败", 100002);
            } else {
                //打印日志
                e.printStackTrace();
            }
        }
        return R.ok(list);
    }

    /**
     * 获取学院列表列表--模糊搜索
     *
     * @param deptName 学院名称
     */
    @GetMapping("/getDeptList")
    public R getDeptList(String deptName) {
        return R.ok(apiLoginService.getDeptList(deptName));
    }

    /**
     * 获取学院列表列表--模糊搜索
     *
     * @param gradeName 学院名称
     */
    @GetMapping("/getGradeList")
    public R getGradeList(String gradeName) {
        List<GradeEntity> list = apiLoginService.getGradeList(gradeName);
        return R.ok(list);
    }

    /**
     * 获取签到课程列表
     */
    @PostMapping("/getSignCourseList")
    public R getSignCourseList(@RequestBody SignCourseParam param) {
        List<SignVo> list = apiSignService.getSignCourseList(param);
        return R.ok(list);
    }

    /**
     * 根据经纬度获取地址
     */
    @PostMapping("/getAddress")
    public R getAddress(@RequestBody Map<String, String> map) {
        String address = BaiduMapGeocode.reverseGeocode(map.get("lat"), map.get("lng"));
        return R.ok(address);
    }

    /**
     * 根据经纬度获取地址
     */
    @PostMapping("/exception")
    public R exception(@RequestBody Map<String, String> map) {
        throw new RuntimeException("测试异常");
    }
}