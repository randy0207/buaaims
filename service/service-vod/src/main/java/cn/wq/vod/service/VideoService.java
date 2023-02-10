package cn.wq.vod.service;

import com.aliyuncs.exceptions.ClientException;

import java.io.InputStream;
import java.util.List;

/**
 * @author LWQ
 * @since 2022/4/24
 */
public interface VideoService {

    String uploadVideo(InputStream inputStream, String originalFilename);

    void removeVideo(String videoId) throws ClientException;

    void removeVideoByIdList(List<String> videoIdList) throws ClientException;

    String getPlayAuth(String videoSourceId) throws ClientException;
}
