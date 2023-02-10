package cn.wq.edu.feign;

import cn.wq.edu.feign.fallback.VodMediaServiceFallBack;
import cn.wq.result.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * @author LWQ
 * @since 2022/4/24
 */
@Service
@FeignClient(value = "service-vod", fallback = VodMediaServiceFallBack.class)
public interface VodMediaService {

    @DeleteMapping("/admin/vod/media/remove/{vodId}")
    R removeVideo(@PathVariable("vodId") String vodId);

    @DeleteMapping("/admin/vod/media/remove")
    R removeVideoByIdList(@RequestBody List<String> videoIdList);
}
