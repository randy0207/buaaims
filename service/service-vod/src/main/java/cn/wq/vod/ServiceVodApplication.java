package cn.wq.vod;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})
public class ServiceVodApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceVodApplication.class, args);
    }

}
