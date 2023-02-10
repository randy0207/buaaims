package cn.wq.edu.feign.fallback;

import cn.wq.edu.feign.VodMediaService;
import cn.wq.result.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LWQ
 * @since 2022/4/24
 */
@Service
@Slf4j
public class VodMediaServiceFallBack implements VodMediaService {
    @Override
    public R removeVideo(String vodId) {
        log.info("熔断保护");
        return R.error();
    }

    @Override
    public R removeVideoByIdList(List<String> videoIdList) {
        log.info("熔断保护");
        return R.error();
    }
}
