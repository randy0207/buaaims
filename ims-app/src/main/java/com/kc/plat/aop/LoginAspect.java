package com.kc.plat.aop;

import com.kc.plat.annontions.Auth;
import com.kc.plat.common.R;
import com.kc.plat.model.XcxTokenEntity;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.DataClassRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.List;

@Aspect
@Component
public class LoginAspect {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Pointcut("@annotation(com.kc.plat.annontions.Auth)||@within(com.kc.plat.annontions.Auth)")
    public void pointCut() {
    }

    //前置通知
    @Before("pointCut()")
    public void before(JoinPoint joinPoint) {

    }

    /**
     * 环绕通知
     */
    @Around("pointCut()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        MethodSignature signature = (MethodSignature) proceedingJoinPoint.getSignature();
        Method method = signature.getMethod();
        Annotation annotation = method.getAnnotation(Auth.class);
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        //从获取RequestAttributes中获取HttpServletRequest的信息
        HttpServletRequest request = (HttpServletRequest) requestAttributes.resolveReference(RequestAttributes.REFERENCE_REQUEST);
        //有这个注解的时候就校验权限----没有的就放行
        if (annotation != null) {
            //开始查看是否有权限
            String token = request.getHeader("token");
            XcxTokenEntity xcxTokenEntity = getToken(token);
            if (xcxTokenEntity == null) {
                return R.error("未登录，请重新登录系统", 100001);
            } else if (xcxTokenEntity.getExpire_time().getTime() < System.currentTimeMillis()) {
                //token过期
                return R.error("token过期", 100001);
            }
        }
        Object proceed = proceedingJoinPoint.proceed();
        return proceed;
    }


    public XcxTokenEntity getToken(String token) {
        String sql = "select * from xcx_token where token = '%s'";
        String format = String.format(sql, token);
        List<XcxTokenEntity> list = jdbcTemplate.query(format, new DataClassRowMapper<>(XcxTokenEntity.class));
        return list.size() > 0 ? list.get(0) : null;
    }
}
