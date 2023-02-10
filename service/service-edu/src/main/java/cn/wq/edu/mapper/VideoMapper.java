package cn.wq.edu.mapper;

import cn.wq.edu.entity.Video;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 课程视频 Mapper 接口
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Mapper
public interface VideoMapper extends BaseMapper<Video> {

}
