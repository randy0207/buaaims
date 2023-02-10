package cn.wq.edu.entity;

import cn.wq.base.model.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 课程收藏
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("edu_course_collect")
@ApiModel(value = "CourseCollect对象", description = "课程收藏")
public class CourseCollect extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "课程讲师ID")
    private String courseId;

    @ApiModelProperty(value = "课程专业ID")
    private String memberId;

}
