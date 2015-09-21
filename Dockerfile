
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
RUN chown -R www-data:www-data /app/system

VOLUME  ["/app"]

CMD ["/run.sh"]
