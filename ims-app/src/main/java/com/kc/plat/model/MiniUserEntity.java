package com.kc.plat.model;



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

@Erupt(name = "小程序注册登陆表")
@Table(name = "mini_user")
@Entity
@Data
public class MiniUserEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "注册Id"
            ),
            edit = @Edit(
                    title = "注册Id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String userId;

    @EruptField(
            views = @View(
                    title = "注册类型:1是学生，2是教师"
            ),
            edit = @Edit(
                    title = "注册类型:1是学生，2是教师",
                    type = EditType.CHOICE, search = @Search, notNull = true,
                    choiceType = @ChoiceType(vl = {@VL(value = "xxx", label = "xxx"), @VL(value = "yyy", label = "yyy")})
            )
    )
    private String register_type;

    @EruptField(
            views = @View(
                    title = "用户名"
            ),
            edit = @Edit(
                    title = "用户名",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String username;

    @EruptField(
            views = @View(
                    title = "密码"
            ),
            edit = @Edit(
                    title = "密码",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String password;

    @EruptField(
            views = @View(
                    title = "关联不同类型的用户id"
            ),
            edit = @Edit(
                    title = "关联不同类型的用户id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String relation_id;

    @EruptField(
            views = @View(
                    title = "学院id"
            ),
            edit = @Edit(
                    title = "学院id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String dept_id;
    @EruptField(
            views = @View(
                    title = "昵称"
            ),
            edit = @Edit(
                    title = "昵称",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String nick_name;

    @EruptField(
            views = @View(
                    title = "性别"
            ),
            edit = @Edit(
                    title = "性别",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    //0是男，1是女
    private String gender;

    @EruptField(
            views = @View(
                    title = "年级"
            ),
            edit = @Edit(
                    title = "年级",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String grade_id;

}