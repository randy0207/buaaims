package cn.wq.edu.service.impl;

import cn.wq.edu.entity.Comment;
import cn.wq.edu.mapper.CommentMapper;
import cn.wq.edu.service.CommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 评论 服务实现类
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

}
