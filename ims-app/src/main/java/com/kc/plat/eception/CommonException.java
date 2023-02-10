package com.kc.plat.eception;

/**
 * 公共异常处理类
 */
public class CommonException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public CommonException() {
        super();
    }

    public CommonException(String message) {
        super(message);
    }

    public CommonException(String message, Throwable cause) {
        super(message, cause);
    }

    public CommonException(Throwable cause) {
        super(cause);
    }

}
