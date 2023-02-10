package cn.wq.vod.controller.api;


import cn.wq.vod.result.R;
import cn.wq.vod.result.ResultCodeEnum;
import cn.wq.vod.service.VideoService;
import cn.wq.vod.util.ExceptionUtils;
import cn.wq.vod.util.MyException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author LWQ
 * @since 2022/4/27
 */
@Api(tags = "阿里云视频点播")
// @CrossOrigin //跨域
@RestController
@RequestMapping("/api/vod/media")
@Slf4j
public class ApiMediaController {

    @Autowired
    private VideoService videoService;

    @GetMapping("get-play-auth/{videoSourceId}")
    public R getPlayAuth(
            @ApiParam(value = "阿里云视频文件的id", required = true) @PathVariable String videoSourceId) {

        try {
            String playAuth = videoService.getPlayAuth(videoSourceId);
            return R.ok().message("获取播放凭证成功").data("playAuth", playAuth);
        } catch (Exception e) {
            log.error(ExceptionUtils.getMessage(e));
            throw new MyException(ResultCodeEnum.FETCH_PLAYAUTH_ERROR);
        }
    }
}
