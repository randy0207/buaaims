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

@Erupt(name = "年级管理")
@Table(name = "grade")
@Entity
@Data
public class GradeEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "年级Id"
            ),
            edit = @Edit(
                    title = "年级Id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String grade_id;

    @EruptField(
            views = @View(
                    title = "年级名"
            ),
            edit = @Edit(
                    title = "年级名",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String grade_name;

}