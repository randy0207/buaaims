package cn.wq.vod.util;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.profile.DefaultProfile;

/**
 * @author LWQ
 * @since 2022/4/24
 */
public class AliyunVodSDKUtils {

    /**
     * client初始化
     * 
     * @param accessKeyId
     * @param accessKeySecret
     * @return
     */
    public static DefaultAcsClient initVodClient(String accessKeyId, String accessKeySecret) {
        String regionId = "cn-shanghai"; // 点播服务接入区域
        DefaultProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, accessKeySecret);
        DefaultAcsClient client = new DefaultAcsClient(profile);
        return client;
    }
}
