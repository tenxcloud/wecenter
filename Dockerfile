
FROM tutum/lamp:latest
MAINTAINER TenxCloud

# Install plugins
RUN apt-get update && \
  apt-get -y install php5-gd && \
  apt-get -y install curl && \
  apt-get -y install unzip && \
  rm -rf /var/lib/apt/lists/*

RUN curl -o WeCenter_3-1-4.zip -SL http://www.wecenter.com/download/WeCenter_3-1-4.zip \
    && unzip WeCenter_3-1-4.zip 
    && mv WeCenter_3-1-4/UPLOAD/*  /app
    
# Modify permissions to allow plugin upload
RUN chown -R www-data:www-data /app/system

EXPOSE 80
CMD ["/run.sh"]
