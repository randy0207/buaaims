package cn.wq.vod.util;

import cn.wq.vod.result.ResultCodeEnum;
import lombok.Data;

/**
 * @author LWQ
 * @since 2022/4/15
 */
@Data
public class MyException extends RuntimeException {

    private Integer code;

    public MyException(String message, Integer code) {
        super(message);
        this.code = code;
    }

    public MyException(ResultCodeEnum resultCodeEnum) {
        super(resultCodeEnum.getMessage());
        this.code = resultCodeEnum.getCode();
    }

    @Override
    public String toString() {
        return "GuliException{" +
                "code=" + code +
                ", message=" + this.getMessage() +
                '}';
    }
}
