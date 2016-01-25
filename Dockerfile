# 知识分享系统
# 使用时速云 [代码构建] 和 [持续集成]
# Version:1.0.0

FROM tutum/apache-php:latest
MAINTAINER TenxCloud

# Install plugins
RUN apt-get update && \
  apt-get -y install php5-gd && \
  apt-get -y install php5-curl && \
  apt-get -y install curl && \
  apt-get -y install unzip && \
  rm -rf /var/lib/apt/lists/*

RUN curl -o WeCenter_3-1-4.zip -SL http://www.wecenter.com/download/WeCenter_3-1-4.zip \
    && unzip WeCenter_3-1-4.zip -d WeCenter \
    && mv WeCenter/UPLOAD/*  /app \
    && rm -rf WeCenter/* \
    && rm -rf WeCenter_3-1-4.zip
    
# Modify permissions to allow plugin upload
RUN mkdir /app/tmp && mkdir /app/cache && chmod -R 777 /app/tmp && chmod -R 777 /app/cache 

RUN mv /app/system /app/system_bak
VOLUME  ["/app/uploads","/app/system"]
RUN chown -R www-data:www-data /app/system
RUN cp /app/system_bak /app/system

CMD ["/run.sh"]
