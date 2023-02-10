package com.kc.plat.util;

import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.lang.GeoLocation;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.GpsDirectory;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.Objects;

public class PictureUtil {
    public static  void readPic() {
        System.out.println("开始读取图片信息...");
        File jpegFile = new File("F:\\IdeaProjects\\kcplat\\src\\main\\java\\com\\kc\\plat\\util\\ac54c953a417c5ffbea606e69f7ff55.jpg");
        Metadata metadata;
        try {
            metadata = JpegMetadataReader.readMetadata(jpegFile);
            Iterator<Directory> it = metadata.getDirectories().iterator();
            while (it.hasNext()) {
                Directory exif = it.next();
                Iterator<Tag> tags = exif.getTags().iterator();
                while (tags.hasNext()) {
                    Tag tag = (Tag) tags.next();
                    System.out.println(tag);
                }
            }
            System.out.println("图片信息读取完成！");
        } catch (JpegProcessingException e) {
            e.printStackTrace();
        } catch (IOException e) {
        }
    }
    private static void readPic2(String pathname) throws JpegProcessingException, IOException {
        File jpegFile = new File(pathname);
        Metadata metadata = JpegMetadataReader.readMetadata(jpegFile);
        GpsDirectory gpsDirectory = metadata.getFirstDirectoryOfType(GpsDirectory.class);
        if (Objects.nonNull(gpsDirectory)) {
            GeoLocation geoLocation = gpsDirectory.getGeoLocation();
            System.out.println(geoLocation.getLongitude());
            System.out.println(geoLocation.getLatitude());
        }
    }

    public static void readPic(String pathname) throws JpegProcessingException, IOException {
        File jpegFile = new File(pathname);
        Metadata metadata = JpegMetadataReader.readMetadata(jpegFile);
        //获取图片所有EXIF信息
        Iterable<Directory> directories = metadata.getDirectories();
        for (Directory directory : directories) {
            for (Tag tag : directory.getTags()) {
                System.out.println(tag);
            }
        }
    }
    public static void main(String[] args) throws JpegProcessingException, IOException {
//        readPic();
//        readPic2("F:\\IdeaProjects\\kcplat\\src\\main\\java\\com\\kc\\plat\\util\\ac54c953a417c5ffbea606e69f7ff55.jpg");
        readPic("F:\\IdeaProjects\\kcplat\\src\\main\\java\\com\\kc\\plat\\util\\ac54c953a417c5ffbea606e69f7ff55.jpg");
    }
}