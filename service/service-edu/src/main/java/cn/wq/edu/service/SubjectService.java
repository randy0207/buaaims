package cn.wq.edu.service;

import cn.wq.edu.entity.Subject;
import cn.wq.edu.entity.vo.SubjectVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.InputStream;
import java.util.List;

/**
 * <p>
 * 课程科目 服务类
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
public interface SubjectService extends IService<Subject> {

    void batchImport(InputStream inputStream);

    List<SubjectVo> nestedList();
}
