package com.kc.plat.model;



import javax.persistence.*;

import lombok.Data;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.toolkit.handler.SqlChoiceFetchHandler;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;
/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;

@Erupt(name = "学生表")
@Table(name = "student")
@Entity
public class StudentEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "学生id"
            ),
            edit = @Edit(
                    title = "学生id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String stu_id;

//    @EruptField(
//            views = @View(
//                    title = "学院id"
//            ),
//            edit = @Edit(
//                    title = "学院id",
//                    type = EditType.CHOICE, search = @Search, notNull = true,
//                    choiceType = @ChoiceType(vl = {@VL(value = "xxx", label = "xxx"), @VL(value = "yyy", label = "yyy")})
//            )
//    )
@EruptField(
        views = @View(title = "学院"),
        edit = @Edit(
                search = @Search,
                title = "学院",
                type = EditType.CHOICE,
                choiceType = @ChoiceType(
                        fetchHandler = SqlChoiceFetchHandler.class,
                        //参数一必填，表示sql语句
                        //参数二可不填，表示缓存时间，默认为3000毫秒，1.6.10及以上版本支持
                        fetchHandlerParams = {"select id, dept_name from kc_dept", "5000"}
                ))
)
    private String dept_id;

    @EruptField(
            views = @View(
                    title = "学生学院"
            ),
            edit = @Edit(
                    title = "学生学院",
                    type = EditType.CHOICE, search = @Search, notNull = true,
                    choiceType = @ChoiceType(vl = {@VL(value = "xxx", label = "xxx"), @VL(value = "yyy", label = "yyy")})
            )
    )
    private String stu_dept;

}