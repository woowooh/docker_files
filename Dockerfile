FROM ubuntu:18.04
# 换源
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update
# 安装ifconfig
RUN apt-get install  net-tools   
# ping
RUN apt-get install iputils-ping     

#软件目录
RUN mkdir -p /opt/soft/
ADD jdk-8u231-linux-x64.tar.gz /opt/soft/
ADD apache-tomcat-8.5.50.tar.gz /opt/soft/
RUN ls -lh /opt/soft/
RUN chmod 755 "/opt/soft/jdk1.8.0_231"
RUN chmod 755 "/opt/soft/apache-tomcat-8.5.50"
RUN mv "/opt/soft/jdk1.8.0_231" /opt/soft/jdk
RUN mv "/opt/soft/apache-tomcat-8.5.50" /opt/soft/tomcat

ENV JAVA_HOME=/opt/soft/jdk
ENV JRE_HOME=$JAVA_HOME/jre
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib:$CLASSPATH
ENV PATH=/sbin:$JAVA_HOME/bin:$PATH

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

CMD ["/opt/soft/tomcat/bin/catalina.sh","run"]
EXPOSE 8080