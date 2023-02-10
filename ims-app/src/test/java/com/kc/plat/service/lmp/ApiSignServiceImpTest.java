package com.kc.plat.service.lmp;

import com.kc.plat.ImsAppApplication;
import com.kc.plat.model.MiniUserEntity;
import com.kc.plat.model.vo.SignTotalVo;
import com.kc.plat.service.ApiSignService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ImsAppApplication.class)
class ApiSignServiceImpTest {

    @Autowired
    private ApiSignService apiSignService ;
    @Test
    void get() {
        MiniUserEntity miniUserEntity = new MiniUserEntity();
        miniUserEntity.setUserId("1");
        miniUserEntity.setDept_id("1234");
        List<SignTotalVo> list = apiSignService.totalSign(miniUserEntity);
        System.out.println(list);
    }
}