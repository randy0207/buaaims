package cn.wq.edu.mapper;

import cn.wq.edu.entity.Comment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 评论 Mapper 接口
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {

}
