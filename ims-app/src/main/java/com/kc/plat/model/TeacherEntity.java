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

@Erupt(name = "教师表")
@Table(name = "teacher")
@Entity
@Data
public class TeacherEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "教师Id"
            ),
            edit = @Edit(
                    title = "教师Id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String teacher_id;

    @EruptField(
            views = @View(
                    title = "教师名称"
            ),
            edit = @Edit(
                    title = "教师名称",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String teacher_name;

    @EruptField(
            views = @View(
                    title = "教师邮件"
            ),
            edit = @Edit(
                    title = "教师邮件",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String teacher_email;

    @EruptField(
            views = @View(
                    title = "教师手机号码"
            ),
            edit = @Edit(
                    title = "教师手机号码",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String teacher_phone;

}