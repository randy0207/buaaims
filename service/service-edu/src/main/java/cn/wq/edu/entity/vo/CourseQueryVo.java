package cn.wq.edu.entity.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author LWQ
 * @since 2022/4/21
 */
@Data
public class CourseQueryVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String title;
    private String teacherId;
    private String subjectParentId;
    private String subjectId;
}