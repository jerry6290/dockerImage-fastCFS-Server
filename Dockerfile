FROM centos:centos7
MAINTAINER "jerry6290@163.com"

COPY shell/start.sh start.sh
RUN yum install -y which net-tools
RUN  curl -o ./fastcfs.sh https://toscode.gitee.com/fastdfs100/FastCFS/raw/master/fastcfs.sh \
    && chmod +x ./fastcfs.sh \
    && ./fastcfs.sh install || exit 1 \
    && ./fastcfs.sh config --force

COPY shell/start.sh start.sh
RUN chmod +x ./start.sh
CMD ./start.sh