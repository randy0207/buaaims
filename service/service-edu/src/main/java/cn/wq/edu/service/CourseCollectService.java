package cn.wq.edu.service;

import cn.wq.edu.entity.CourseCollect;
import cn.wq.edu.entity.vo.CourseCollectVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 课程收藏 服务类
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
public interface CourseCollectService extends IService<CourseCollect> {

    boolean isCollect(String courseId, String memberId);

    void saveCourseCollect(String courseId, String memberId);

    List<CourseCollectVo> selectListByMemberId(String memberId);

    boolean removeCourseCollect(String courseId, String memberId);
}
