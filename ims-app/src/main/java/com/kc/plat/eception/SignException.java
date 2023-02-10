package com.kc.plat.eception;

public class SignException extends RuntimeException {
    private static final long serialVersionUID = 1L;
    private String code;

    public String getCode() {
        return code;
    }
    public SignException() {
        super();
    }

    public SignException(String message) {
        super(message);
    }
    public SignException(String message,String code) {
        super(message);
        this.code = code;
    }
    public SignException(String message, Throwable cause) {
        super(message, cause);
    }

    public SignException(Throwable cause) {
        super(cause);
    }

    protected SignException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
