package cn.wq.edu.mapper;

import cn.wq.base.dto.CourseDto;
import cn.wq.edu.entity.Course;
import cn.wq.edu.entity.vo.CoursePublishVo;
import cn.wq.edu.entity.vo.CourseVo;
import cn.wq.edu.entity.vo.WebCourseVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Mapper
public interface CourseMapper extends BaseMapper<Course> {

    List<CourseVo> selectPageByCourseQueryVo(
            Page<CourseVo> pageParam,
            @Param(Constants.WRAPPER) QueryWrapper<CourseVo> queryWrapper);

    CoursePublishVo selectCoursePublishVoById(String id);

    WebCourseVo selectWebCourseVoById(String courseId);

    CourseDto selectCourseDtoById(String courseId);
}
