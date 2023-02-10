package cn.wq.edu.controller.api;

import cn.wq.edu.entity.vo.SubjectVo;
import cn.wq.edu.service.SubjectService;
import cn.wq.result.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author LWQ
 * @since 2022/4/27
 */
// @CrossOrigin
@Api(tags = "课程分类")
@RestController
@RequestMapping("/api/edu/subject")
public class ApiSubjectController {

    @Resource
    private SubjectService subjectService;

    @ApiOperation("嵌套数据列表")
    @GetMapping("nested-list")
    public R nestedList() {
        List<SubjectVo> subjectVoList = subjectService.nestedList();
        return R.ok().data("items", subjectVoList);
    }
}
