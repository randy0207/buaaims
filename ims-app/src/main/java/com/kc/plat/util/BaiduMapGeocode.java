package com.kc.plat.util;

import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSONObject;

/**
 * desc: 百度逆地理编码  (通过经纬度获取具体位置)
 *
 * @author qts
 * @date 2021/7/7 0007 下午 4:12
 */
public class BaiduMapGeocode {

    private final static String AK = "iiKLscA8Xe6fldsntdHtY1GIekyFRWiq";// 百度地图密钥

    public static void main(String[] args) {
        String lng="23.099994";//116.42 39.93
        String lat="113.324520";
        String s = reverseGeocode(lng, lat);
        System.out.println(s);
    }

    /**
     *
     * @param lng 经度
     * @param lat 纬度
     * @return
     */
    public static String reverseGeocode(String lng,String lat){
        String location=lng+","+lat;
        String url="http://api.map.baidu.com/reverse_geocoding/v3/?ak="+AK+"&output=json&coordtype=wgs84ll&location="+location;
        String res=doGet(url);
        JSONObject jsonObject = JSONObject.parseObject(res);
        return jsonObject.getJSONObject("result").getString("formatted_address");
    }

    public static String doGet(String url) {
        String s = HttpUtil.get(url);
        return s;
    }

}
