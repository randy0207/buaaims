package cn.keking.web.controller;

import cn.keking.config.ConfigConstants;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

/**
 * @Author:WQ
 * @Date:2022-05-28-0:09
 * @Description:
 */
@Controller
@RequestMapping("file")
public class FileDownloadController {


    private final Logger logger = LoggerFactory.getLogger(FileController.class);

    private final String fileDir = ConfigConstants.getFileDir();
    private final String demoDir = "demo";
    private final String demoPath = demoDir + File.separator;

    @ResponseBody
    @RequestMapping(value = "/fetch", method = RequestMethod.POST)
    public String fileDownload(@RequestParam("fileName") String fileName, HttpServletResponse response)throws Exception{
        List<Map<String, String>> list = new ArrayList<>();
        File downloadFile = new File(fileDir + demoPath+ File.separator+fileName);
        // 获取文件目录
        System.out.println("下载文件的完整路径："+downloadFile.getAbsolutePath());
        if(!downloadFile.exists()){
            System.out.println("要下载的文件不存在："+downloadFile.getAbsolutePath());
            return "File not exists, download fail!";
        }else {
            //第一步：设置响应类型
            response.setContentType("application/force-download");//应用程序强制下载
            //第二读取文件
            InputStream in = new FileInputStream(downloadFile);
            //设置响应头，对文件进行url编码
            fileName = URLEncoder.encode(fileName, "UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename="+fileName);
            response.setContentLength(in.available());

            //第三步：读文件写入http响应
            OutputStream out = response.getOutputStream();
            byte[] b = new byte[1024];
            int len = 0;
            while((len = in.read(b))!=-1){
                out.write(b, 0, len);
            }
            out.flush();
            out.close();
            in.close();
            return "文件下载成功!";
        }
    }
}
