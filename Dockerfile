FROM centos:centos7
MAINTAINER "jerry6290@163.com"

COPY shell/start.sh start.sh
RUN yum install -y which net-tools
RUN  curl -o ./fastcfs.sh https://raw.githubusercontent.com/happyfish100/FastCFS/master/fastcfs.sh \
    && chmod +x ./fastcfs.sh \
    && ./fastcfs.sh install || exit 1

COPY shell/start.sh start.sh
COPY conf/fastcfs/ /
RUN chmod +x ./start.sh
CMD ./start.sh