package cn.wq.edu.mapper;

import cn.wq.edu.entity.Subject;
import cn.wq.edu.entity.vo.SubjectVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * 课程科目 Mapper 接口
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Mapper
public interface SubjectMapper extends BaseMapper<Subject> {

    List<SubjectVo> selectNestedListByParentId(String parentId);
}
