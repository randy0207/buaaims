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

@Erupt(name = "教师学院表")
@Table(name = "teacher_dept")
@Entity
@Data
public class TeacherDeptEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "教师Id"
            ),
            edit = @Edit(
                    title = "教师Id",
                    type = EditType.CHOICE, search = @Search, notNull = true,
                    choiceType = @ChoiceType(vl = {@VL(value = "xxx", label = "xxx"), @VL(value = "yyy", label = "yyy")})
            )
    )
    private String teacher_id;

    @EruptField(
            views = @View(
                    title = "学院Id"
            ),
            edit = @Edit(
                    title = "学院Id",
                    type = EditType.CHOICE, search = @Search, notNull = true,
                    choiceType = @ChoiceType(vl = {@VL(value = "xxx", label = "xxx"), @VL(value = "yyy", label = "yyy")})
            )
    )
    private String dept_id;

}