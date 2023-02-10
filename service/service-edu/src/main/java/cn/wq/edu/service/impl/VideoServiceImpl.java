package cn.wq.edu.service.impl;

import cn.wq.edu.entity.Video;
import cn.wq.edu.feign.VodMediaService;
import cn.wq.edu.mapper.VideoMapper;
import cn.wq.edu.service.VideoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程视频 服务实现类
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Service
public class VideoServiceImpl extends ServiceImpl<VideoMapper, Video> implements VideoService {

    @Resource
    private VodMediaService vodMediaService;

    @Override
    public void removeMediaVideoById(String id) {

        log.warn("VideoServiceImpl：video id = " + id);
        // 根据videoid找到视频id
        Video video = baseMapper.selectById(id);
        String videoSourceId = video.getVideoSourceId();
        log.warn("VideoServiceImpl：videoSourceId= " + videoSourceId);
        vodMediaService.removeVideo(videoSourceId);
    }

    @Override
    public void removeMediaVideoByChapterId(String chapterId) {
        QueryWrapper<Video> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("video_source_id");
        queryWrapper.eq("chapter_id", chapterId);

        List<Map<String, Object>> maps = baseMapper.selectMaps(queryWrapper);
        List<String> videoSourceIdList = this.getVideoSourceIdList(maps);
        vodMediaService.removeVideoByIdList(videoSourceIdList);
    }

    @Override
    public void removeMediaVideoByCourseId(String chapterId) {
        QueryWrapper<Video> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("video_source_id");
        queryWrapper.eq("course_id", chapterId);

        List<Map<String, Object>> maps = baseMapper.selectMaps(queryWrapper);
        List<String> videoSourceIdList = this.getVideoSourceIdList(maps);
        vodMediaService.removeVideoByIdList(videoSourceIdList);
    }

    /**
     * 组装视频id列表
     * 
     * @param maps
     * @return
     */
    private List<String> getVideoSourceIdList(List<Map<String, Object>> maps) {
        ArrayList<String> videoSourceIdList = new ArrayList<>();
        for (Map<String, Object> map : maps) {
            String videoSourceId = (String) map.get("video_source_id");
            videoSourceIdList.add(videoSourceId);
        }
        return videoSourceIdList;
    }
}
