package cn.wq.edu.controller.api;

import cn.wq.edu.entity.Teacher;
import cn.wq.edu.service.TeacherService;
import cn.wq.result.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author LWQ
 * @since 2022/4/25
 */
 //@CrossOrigin
@Api(tags= "讲师")
@RestController
@RequestMapping("/api/edu/teacher")
public class ApiTeacherController {

    @Autowired
    private TeacherService teacherService;

    @ApiOperation(value = "所有讲师列表")
    @GetMapping("list")
    public R listAll() {
        List<Teacher> list = teacherService.list();
        return R.ok().data("items", list).message("获取讲师列表成功");
    }

    @ApiOperation(value = "获取讲师")
    @GetMapping("get/{id}")
    public R get(
            @ApiParam(value = "讲师ID", required = true) @PathVariable String id) {
        Map<String, Object> map = teacherService.selectTeacherInfoById(id);
        System.out.println(map);
        return R.ok().data(map);
    }
}
