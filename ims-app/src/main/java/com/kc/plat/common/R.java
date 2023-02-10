package com.kc.plat.common;

public class R {
    //响应码
    private int code;
    //响应消息
    private Object body;
    //响应描述
    private String msg;

    public int getCode() {
        return code;
    }

    public Object getBody() {
        return body;
    }

    public String getMsg() {
        return msg;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public void setBody(Object body) {
        this.body = body;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public static R ok() {
        R r = new R();
        r.setCode(100000);
        r.setBody(null);
        r.setMsg("成功");
        return r;
    }
    public static R ok(Object body) {
        R r = new R();
        r.setCode(100000);
        r.setBody(body);
        r.setMsg("成功");
        return r;
    }
    public static R ok(int code,String msg) {
        R r = new R();
        r.setCode(code);
        r.setBody(null);
        r.setMsg(msg);
        return r;
    }
    public static R ok(int code,String msg,Object body) {
        R r = new R();
        r.setCode(code);
        r.setBody(body);
        r.setMsg(msg);
        return r;
    }
    public static R error() {
        R r = new R();
        r.setCode(100001);
        r.setBody(null);
        r.setMsg("失败");
        return r;
    }
    public static R error(Object body) {
        R r = new R();
        r.setCode(100001);
        r.setBody(body);
        r.setMsg("失败");
        return r;
    }
    public static R error(int code,String msg) {
        R r = new R();
        r.setCode(code);
        r.setBody(null);
        r.setMsg(msg);
        return r;
    }
    public static R error(int code,String msg,Object body) {
        R r = new R();
        r.setCode(code);
        r.setBody(body);
        r.setMsg(msg);
        return r;
    }
    public static R error(String msg) {
        R r = new R();
        r.setCode(100001);
        r.setBody(null);
        r.setMsg(msg);
        return r;
    }
    public static R error(String msg,Object body) {
        R r = new R();
        r.setCode(100001);
        r.setBody(body);
        r.setMsg(msg);
        return r;
    }
    public static R error(String msg,int code) {
        R r = new R();
        r.setCode(code);
        r.setBody(null);
        r.setMsg(msg);
        return r;
    }
    public static R error(String msg,int code,Object body) {
        R r = new R();
        r.setCode(code);
        r.setBody(body);
        r.setMsg(msg);
        return r;
    }
}
