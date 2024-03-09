FROM debian:bullseye

RUN apt update -y && \
    apt install -y php7.4 php-fpm php-mysql mariadb-client curl

COPY ./tools/setup.sh /wordpress_setup.sh


WORKDIR /var/www/html
CMD ["/wordpress_setup.sh"]
