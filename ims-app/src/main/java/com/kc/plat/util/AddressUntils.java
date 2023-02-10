package com.kc.plat.util;


import cn.hutool.http.HttpUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class AddressUntils {
    //这里添加应用的时候记得要使用windows平台的不要获取小程序或其他的否则会报错
    private static final String key = "1c6c7dba50dfdba107644ceaa09a16ae";//key值用的是高德的key

    public static String getAdd(String lng, String lat) {
        String urlString = "http://restapi.amap.com/v3/geocode/regeo?key="+key+"&location="+lng+ "," +lat;
        String s = HttpUtil.get(urlString);
        return s;
    }
}

