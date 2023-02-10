package cn.wq.edu.mapper;

import cn.wq.edu.entity.CourseCollect;
import cn.wq.edu.entity.vo.CourseCollectVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 课程收藏 Mapper 接口
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Mapper
public interface CourseCollectMapper extends BaseMapper<CourseCollect> {

    List<CourseCollectVo> selectPageByMemberId(String memberId);
}
