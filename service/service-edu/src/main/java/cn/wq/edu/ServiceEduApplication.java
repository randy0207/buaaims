package cn.wq.edu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author LWQ
 * @since 2022/4/1
 */
@EnableFeignClients(basePackages = "cn.wq.edu.feign")
@EnableDiscoveryClient
@SpringBootApplication
//@ComponentScan("cn.wq.edu.mapper")
public class ServiceEduApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceEduApplication.class, args);
    }
}