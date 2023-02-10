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

@Erupt(name = "小程序token记录表")
@Table(name = "xcx_token")
@Entity
@Data
public class XcxTokenEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "用户id"
            ),
            edit = @Edit(
                    title = "用户id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String userId;

    @EruptField(
            views = @View(
                    title = "token"
            ),
            edit = @Edit(
                    title = "token",
                    type = EditType.INPUT, search = @Search,
                    inputType = @InputType
            )
    )
    private String token;

    @EruptField(
            views = @View(
                    title = "过期时间"
            ),
            edit = @Edit(
                    title = "过期时间",
                    type = EditType.DATE, search = @Search,
                    dateType = @DateType(type = DateType.Type.DATE_TIME)
            )
    )
    private Date expire_time;

}