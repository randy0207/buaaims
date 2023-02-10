package cn.keking.web.controller;

import lombok.Data;

/**
 * @Author:WQ
 * @Date:2022-05-27-23:38
 * @Description:
 */
@Data
public class FileMessageVO {
    /**
     * 文件路径
     */
    private String fileRoute;

    /**
     * 下载地址
     */
    private String fileDownloadUri;

    /**
     * 文件类型
     */
    private String fileType;

    /**
     * 文件大小
     */
    private String size;

    /**
     * 在线预览字段
     */
    private String fullfilename;
}
