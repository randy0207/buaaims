package cn.wq.edu.mapper;

import cn.wq.edu.entity.CourseDescription;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 课程简介 Mapper 接口
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Mapper
public interface CourseDescriptionMapper extends BaseMapper<CourseDescription> {

}
