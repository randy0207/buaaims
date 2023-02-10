package cn.wq.edu.service;

import cn.wq.edu.entity.Teacher;
import cn.wq.edu.entity.vo.TeacherQueryVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 服务类
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
public interface TeacherService extends IService<Teacher> {

    IPage<Teacher> selectPage(Page<Teacher> pageParam, TeacherQueryVo teacherQueryVo);

    List<Map<String, Object>> selectNameList(String key);

    boolean removeAvatarById(String id);

    Map<String, Object> selectTeacherInfoById(String id);

    List<Teacher> selectHotTeacher();

}
