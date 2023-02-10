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

@Erupt(name = "学院表")
@Table(name = "kc_dept")
@Entity
@Data
public class KcDeptEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "学院Id"
            ),
            edit = @Edit(
                    title = "学院Id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String dept_id;

    @EruptField(
            views = @View(
                    title = "学院名称"
            ),
            edit = @Edit(
                    title = "学院名称",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String dept_name;

}