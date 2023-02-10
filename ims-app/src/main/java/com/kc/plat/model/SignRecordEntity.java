package com.kc.plat.model;


/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;

import lombok.Data;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;

@Erupt(name = "签到记录表")
@Table(name = "sign_record")
@Entity
@Data
public class SignRecordEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "签到发布Id"
            ),
            edit = @Edit(
                    title = "签到发布Id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String sign_publish_id;

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
    private Date sign_create_time;

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
                    title = "记录id"
            ),
            edit = @Edit(
                    title = "记录id",
                    type = EditType.INPUT, notNull = true,
                    inputType = @InputType
            )
    )
    private String record_id;

    @EruptField(
            views = @View(
                    title = "学生Id"
            ),
            edit = @Edit(
                    title = "学生Id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String stu_id;

    @EruptField(
            views = @View(
                    title = "签到状态"
            ),
            edit = @Edit(
                    title = "签到状态",
                    type = EditType.HIDDEN, search = @Search
            )
    )
    private String sign_status;

}