package com.kc.plat.common;

import com.kc.plat.eception.CommonException;
import com.kc.plat.eception.LoginException;
import com.kc.plat.eception.SignException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.logging.Logger;

@ControllerAdvice(basePackages = "com.kc.plat.controller")
public class ExceptionAdvice {
    private static final Logger logger = Logger.getLogger(ExceptionAdvice.class.getName());

    @ExceptionHandler(value = {Exception.class})
    @ResponseBody
    public R runtimeException(Exception e) {
        e.printStackTrace();
        return R.error("系统异常", e.getMessage());
    }

}
