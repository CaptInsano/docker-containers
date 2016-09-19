FROM alpine:edge
MAINTAINER Etopian Inc. <contact@etopian.com>



LABEL   devoply.type="site" \
        devoply.cms="koel" \
        devoply.framework="laravel" \
        devoply.language="php" \
        devoply.require="mariadb etopian/nginx-proxy" \
        devoply.description="Koel music player." \
        devoply.name="Koel" \
        devoply.params="docker run -d --name {container_name} -e VIRTUAL_HOST={virtual_hosts} -v /data/sites/{domain_name}:/DATA etopian/docker-koel"


RUN apk update \
    && apk add bash less vim nginx ca-certificates nodejs \
    php5-fpm php5-json php5-zlib php5-xml php5-pdo php5-phar php5-openssl \
    php5-pdo_mysql php5-mysqli \
    php5-gd php5-iconv php5-mcrypt \
    php5-mysql php5-curl php5-opcache php5-ctype php5-apcu \
    php5-intl php5-bcmath php5-dom php5-xmlreader php5-xsl mysql-client \
    git build-base python \
    ffmpeg inotify-tools sudo curl \
    && apk add -u musl

RUN rm -rf /var/cache/apk/*

ENV TERM="xterm" \
    DB_HOST="" \
    DB_DATABASE="" \
    DB_USERNAME=""\
    DB_PASSWORD=""\
    ADMIN_EMAIL=""\
    ADMIN_NAME=""\
    ADMIN_PASSWORD=""\
    APP_DEBUG=false\
    AP_ENV=production

VOLUME ["/DATA/music"]


RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/php.ini && \
sed -i 's/nginx:x:99:100:nginx:\/var\/lib\/nginx:\/sbin\/nologin/nginx:x:99:100:Linux User,,,:\/DATA:\/bin\/bash/g' /etc/passwd && \
sed -i 's/nginx:x:99:100:nginx:\/var\/lib\/nginx:\/sbin\/nologin/nginx:x:99:100:Linux User,,,:\/DATA:\/bin\/bash/g' /etc/passwd-
 

ADD files/nginx.conf /etc/nginx/
ADD files/php-fpm.conf /etc/php/
ADD files/run.sh /

RUN chmod +x /run.sh && chown -R nginx:nginx /DATA

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 


RUN su nginx -c "git clone  https://github.com/phanan/koel /DATA/htdocs &&\
    cd /DATA/htdocs && \
    npm install && \
    composer config github-oauth.github.com de3535512dc7a8fdb0fe3d43f3f53fa991b1dc0b &&\
    composer install"
 

#clean up
RUN apk del --purge git build-base python nodejs

COPY files/.env /DATA/htdocs/.env

RUN chown nginx:nginx /DATA/htdocs/.env

#RUN su nginx -c "cd /DATA/htdocs && php artisan init"

EXPOSE 80
CMD ["/run.sh"]
