chcp 65001
@echo off
echo.
echo ============================================================
echo [信息] 欢迎使用 考勤系统2.0 工程。
echo ============================================================
echo "%path%">temp.log
for /f "tokens=*" %%c in (temp.log) do (
    echo %%c|findstr MySQL && (
                         echo 包含 MySQL
                         set isMysql=true
                     ) || (
                         echo 不包含MySQL
                          set isMysql=false
                     )
  echo %%c|findstr Java && (
                         echo 包含 Java
                          set isJava=true
                     ) || (
                         echo 不包含Java
                          set isJava=false
           )
             echo %%c|findstr maven && (
                                    echo 包含 maven
                                     set isMaven=true
                                ) || (
                                    echo 不包含maven
                                     set isMaven=false
                      )
)
::判断是否包含java
if %isJava%==false (echo [信息] 不包含Java环境，请先安装JDK1.8,请使用exe后缀的jdk安装包安装
pause
)
::判断是否包含MySQL
if %isMysql%==false (echo [信息] 不包含MySQL，开始安装MySQL5.7,请使用msi后缀的安装包安装
pause
)

::判断是否包含maven
if %isMaven%==false (echo [信息] 不包含maven，请参照网上教程配置maven环境
pause
)
:: 检查所有环境是否都已经安装
set allowed=false
if  %isJava%==true  (
if %isMysql%==true (
if %isMaven%==true (
set allowed=true
)
)
)
::判断是否包含java,mysql
del temp.log
::检查端口8080是否被占用---其他端口可以修改这个位置
for  /f  "tokens=5" %%i in ('netstat -ano ^| findstr :8080') do (taskkill /f /pid %%i)

if %allowed%==true (
echo.
%~d0
cd %~dp0
cd ..
title %cd%
set MAVEN_OPTS=%MAVEN_OPTS% -Xms256m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m
call mvn clean spring-boot:run -Dmaven.test.skip=true -U
::删除临时文件
pause
)else (
echo [信息] 请检查是否具备运行环境
pause
)

