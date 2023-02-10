package cn.wq.edu.service.impl;

import cn.wq.edu.entity.Subject;
import cn.wq.edu.entity.excel.ExcelSubjectData;
import cn.wq.edu.entity.vo.SubjectVo;
import cn.wq.edu.listener.ExcelSubjectDataListener;
import cn.wq.edu.mapper.SubjectMapper;
import cn.wq.edu.service.SubjectService;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.List;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author LWQ
 * @since 2022-04-01
 */
@Service
public class SubjectServiceImpl extends ServiceImpl<SubjectMapper, Subject> implements SubjectService {

    @Override
    public void batchImport(InputStream inputStream) {
        EasyExcel.read(inputStream, ExcelSubjectData.class, new ExcelSubjectDataListener(baseMapper))
                .excelType(ExcelTypeEnum.XLS)
                .sheet().doRead();
    }

    @Override
    public List<SubjectVo> nestedList() {
        return baseMapper.selectNestedListByParentId("0");
    }
}
