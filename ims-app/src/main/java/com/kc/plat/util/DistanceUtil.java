package com.kc.plat.util;

public class DistanceUtil {
    private static final double EARTH_RADIUS = 6371393; // 平均半径,单位：m；不是赤道半径。赤道为6378左右


    public static double getDistance(Double latitude1, Double longitude1, Double latitude2, Double longitude2) {
        // 纬度
        double lat1 = Math.toRadians(latitude1);
        double lat2 = Math.toRadians(latitude2);
        // 经度
        double lng1 = Math.toRadians(longitude1);
        double lng2 = Math.toRadians(longitude2);
        // 纬度之差
        double a = lat1 - lat2;
        // 经度之差
        double b = lng1 - lng2;
        // 计算两点距离的公式
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) +
                Math.cos(lat1) * Math.cos(lat2) * Math.pow(Math.sin(b / 2), 2)));
         // 返回类型: long，单位: 米
        s = s * EARTH_RADIUS;
        return Math.round(s * 10000) / 10000;
    }
}
