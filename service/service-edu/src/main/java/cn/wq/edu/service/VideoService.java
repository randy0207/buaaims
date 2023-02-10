package cn.wq.edu.service;

import cn.wq.edu.entity.Video;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 课程视频 服务类
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
public interface VideoService extends IService<Video> {

    void removeMediaVideoById(String id);

    void removeMediaVideoByChapterId(String chapterId);

    void removeMediaVideoByCourseId(String chapterId);
}
