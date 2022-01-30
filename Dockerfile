FROM centos:centos7 AS builder
MAINTAINER "jerry6290@163.com"


FROM centos:centos8

RUN wget https://toscode.gitee.com/fastdfs100/FastCFS/raw/master/helloWorld.sh \
    && wget https://toscode.gitee.com/fastdfs100/FastCFS/raw/master/fastcfs.sh \
    && chmod +x helloWorld.sh \
    && chmod +x fastcfs.sh \
    ./helloWorld.sh
