package cn.wq.edu.controller.api;

import cn.wq.edu.entity.Course;
import cn.wq.edu.entity.Teacher;
import cn.wq.edu.service.CourseService;
import cn.wq.edu.service.TeacherService;
import cn.wq.result.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author LWQ
 * @since 2022/4/28
 */
// @CrossOrigin
@Api(description = "首页")
@RestController
@RequestMapping("/api/edu/index")
public class ApiIndexController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private TeacherService teacherService;

    @ApiOperation("课程和讲师的首页数据")
    @GetMapping
    public R index() {

        // 查询热门课程
        List<Course> courseList = courseService.selectHotCourse();

        // 查询推荐讲师
        List<Teacher> teacherList = teacherService.selectHotTeacher();

        return R.ok().data("courseList", courseList).data("teacherList", teacherList);
    }
}
