package cn.wq.gateway.handler;

import org.springframework.boot.autoconfigure.web.ErrorProperties;
import org.springframework.boot.autoconfigure.web.ResourceProperties;
import org.springframework.boot.autoconfigure.web.reactive.error.DefaultErrorWebExceptionHandler;
import org.springframework.boot.web.reactive.error.ErrorAttributes;
import org.springframework.context.ApplicationContext;
import org.springframework.web.reactive.function.server.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author:WQ
 * @Date:2022-05-14-11:38
 * @Description:
 * 自定义异常处理 异常时用JSON代替HTML异常信息
 */
public class JsonExceptionHandler extends DefaultErrorWebExceptionHandler {

    public JsonExceptionHandler(ErrorAttributes errorAttributes, ResourceProperties resourceProperties,
                                ErrorProperties errorProperties, ApplicationContext applicationContext) {
        super(errorAttributes, resourceProperties, errorProperties, applicationContext);
    }

    /**
     * 获取异常属性
     * @param request
     * @param includeStackTrace
     * @return
     */
    protected Map<String, Object> getErrorAttributes(ServerRequest request,boolean includeStackTrace){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("success",false);
        map.put("code",200001);
        map.put("message","网关失败");
        map.put("data",null);
        return map;
    }

    /**
     * 指定响应处理方法为JSON处理的方法
     * @param errorAttributes
     * @return
     */
    protected RouterFunction<ServerResponse> getRouterFunction(ErrorAttributes errorAttributes){
        return RouterFunctions.route(RequestPredicates.all(),this::renderErrorResponse);
    }

    /**
     * 根据code获取对应的HttpStatus
     * @param errorAttributes
     * @return
     */
    protected int getHttpStatus(Map<String,Object> errorAttributes){
        return 200;
    }
}
