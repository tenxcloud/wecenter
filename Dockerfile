
FROM index.tenxcloud.com/tenxcloud/lamp:latest
MAINTAINER TenxCloud

# Install plugins
RUN apt-get update && \
  apt-get -y install php5-gd && \
  rm -rf /var/lib/apt/lists/*

# Download latest version of Wordpress into /app
RUN rm -fr /app && wget http://www.wecenter.com/download/WeCenter_3-1-4.zip && unzip WeCenter_3-1-4.zip 
RUN mv WeCenter_3-1-4/UPLOAD/*  /app

# Modify permissions to allow plugin upload
RUN chown -R www-data:www-data /app/system

EXPOSE 80
CMD ["/run.sh"]
