package com.kc.plat.annontions;

import java.lang.annotation.*;

/**
 * 需要权限控制的方法
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Auth {
}
