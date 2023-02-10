# openjdk1.8
FROM openjdk:8

MAINTAINER "shisheng@live.com"

ADD ./target/kc-plat-0.0.1-SNAPSHOT.jar /app/kc-plat-0.0.1-SNAPSHOT.jar

WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/kc-plat-0.0.1-SNAPSHOT.jar"]