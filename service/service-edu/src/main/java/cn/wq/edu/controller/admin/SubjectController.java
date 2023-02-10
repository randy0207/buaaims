package cn.wq.edu.controller.admin;

import cn.wq.base.exception.MyException;
import cn.wq.edu.entity.vo.SubjectVo;
import cn.wq.edu.service.SubjectService;
import cn.wq.result.R;
import cn.wq.result.ResultCodeEnum;
import cn.wq.util.ExceptionUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
// @CrossOrigin //允许跨域
@Api(tags = "课程分类管理")
@RestController
@RequestMapping("/admin/edu/subject")
@Slf4j
@RefreshScope
public class SubjectController {

    @Resource
    private SubjectService subjectService;

    @ApiOperation("Excel批量导入课程分类")
    @PostMapping("import")
    public R batchImport(
            @ApiParam(value = "Excel文件", required = true) @RequestParam("file") MultipartFile file) {

        try {
            InputStream inputStream = file.getInputStream();
            subjectService.batchImport(inputStream);
            return R.ok().message("批量导入成功");
        } catch (Exception e) {
            log.error(ExceptionUtils.getMessage(e));
            throw new MyException(ResultCodeEnum.EXCEL_DATA_IMPORT_ERROR);
        }
    }

    @ApiOperation("嵌套数据列表")
    @GetMapping("nested-list")
    public R nestedList() {
        List<SubjectVo> subjectVoList = subjectService.nestedList();
        return R.ok().data("items", subjectVoList);
    }
}
