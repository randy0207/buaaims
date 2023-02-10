package cn.wq.edu.service.impl;

import cn.wq.edu.entity.CourseDescription;
import cn.wq.edu.mapper.CourseDescriptionMapper;
import cn.wq.edu.service.CourseDescriptionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程简介 服务实现类
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Service
public class CourseDescriptionServiceImpl extends ServiceImpl<CourseDescriptionMapper, CourseDescription>
        implements CourseDescriptionService {

}
