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

@Erupt(name = "课程表")
@Table(name = "kc")
@Entity
@Data
public class KcEntity extends BaseModel {

    @EruptField(
            views = @View(
                    title = "课程id"
            ),
            edit = @Edit(
                    title = "课程id",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String kc_id;

    @EruptField(
            views = @View(
                    title = "课程名称"
            ),
            edit = @Edit(
                    title = "课程名称",
                    type = EditType.INPUT, search = @Search, notNull = true,
                    inputType = @InputType
            )
    )
    private String kc_name;

}