package com.kc.plat.model;

import javax.persistence.*;


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

@Erupt(name = "课程签到发布")
@Table(name = "kc_sign_puplish")
@Entity
@Data
public class KcSignPublishEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "签到Id"
            ),
            edit = @Edit(
                    title = "签到Id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String sign_id;

    @EruptField(
            views = @View(
                    title = "签到名称"
            ),
            edit = @Edit(
                    title = "签到名称",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String sign_name;

    @EruptField(
            views = @View(
                    title = "签到年级"
            ),
            edit = @Edit(
                    title = "签到年级",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String grade_id;

    @EruptField(
            views = @View(
                    title = "签到地址"
            ),
            edit = @Edit(
                    title = "签到地址",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String address_detail;

    @EruptField(
            views = @View(
                    title = "签到维度"
            ),
            edit = @Edit(
                    title = "签到维度",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String lat;

    @EruptField(
            views = @View(
                    title = "签到经度"
            ),
            edit = @Edit(
                    title = "签到经度",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String lon;

    @EruptField(
            views = @View(
                    title = "签到老师Id"
            ),
            edit = @Edit(
                    title = "签到老师Id",
                    type = EditType.CHOICE, search = @Search, notNull = true,
                    choiceType = @ChoiceType(
                            fetchHandler = SqlChoiceFetchHandler.class,
                            //参数一必填，表示sql语句
                            //参数二可不填，表示缓存时间，默认为3000毫秒，1.6.10及以上版本支持
                            fetchHandlerParams = {"select teacher_id as id,teacher_name from teacher", "5000"}
                    )            )
    )
    private String teacher_id;

    @EruptField(
            views = @View(
                    title = "课程Id"
            ),
            edit = @Edit(
                    title = "课程Id",
                    type = EditType.CHOICE, search = @Search, notNull = true,
                    choiceType = @ChoiceType(
                            fetchHandler = SqlChoiceFetchHandler.class,
                            //参数一必填，表示sql语句
                            //参数二可不填，表示缓存时间，默认为3000毫秒，1.6.10及以上版本支持
                            fetchHandlerParams = {"select kc_id as id,kc_name from kc", "5000"}
                    )
            )
    )
    private String kc_id;

    @EruptField(
            views = @View(
                    title = "签到距离"
            ),
            edit = @Edit(
                    title = "签到距离",
                    type = EditType.NUMBER, search = @Search, notNull = true,
                    numberType = @NumberType
            )
    )
    private Integer sign_distance;

    @EruptField(
            views = @View(
                    title = "学院id"
            ),
            edit = @Edit(
                    title = "学院id",
                    type = EditType.CHOICE, search = @Search, notNull = true,
                    choiceType = @ChoiceType(
                            fetchHandler = SqlChoiceFetchHandler.class,
                            //参数一必填，表示sql语句
                            //参数二可不填，表示缓存时间，默认为3000毫秒，1.6.10及以上版本支持
                            fetchHandlerParams = {"select dept_id as id, dept_name from kc_dept", "5000"}
                    ))
    )
    private String dept_id;

    @EruptField(
            views = @View(
                    title = "应签到数量"
            ),
            edit = @Edit(
                    title = "应签到数量",
                    type = EditType.INPUT,
                    inputType = @InputType
            )
    )
    private String must_sign_num;

    @EruptField(
            views = @View(
                    title = "实际签到数量"
            ),
            edit = @Edit(
                    title = "实际签到数量",
                    type = EditType.HIDDEN
            )
    )
    private String has_sign_num;

    @EruptField(
            views = @View(
                    title = "签到时间"
            ),
            edit = @Edit(
                    title = "签到时间",
                    type = EditType.DATE, search = @Search, notNull = true,
                    dateType = @DateType(type = DateType.Type.DATE_TIME)
            )
    )
    private Date sign_time;

    @EruptField(
            views = @View(
                    title = "签到日期", show = false
            ),
            edit = @Edit(
                    title = "签到日期",
                    type = EditType.HIDDEN, show = false
            )
    )
    private String sign_date;

    @EruptField(
            views = @View(
                    title = "签到最晚时间"
            ),
            edit = @Edit(
                    title = "签到最晚时间",
                    type = EditType.DATE, search = @Search, notNull = true,
                    dateType = @DateType(type = DateType.Type.DATE_TIME)
            )
    )
    private Date sign_last_time;

}