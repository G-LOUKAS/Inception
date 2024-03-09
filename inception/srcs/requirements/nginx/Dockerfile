FROM debian:bullseye

RUN apt update -y && apt install -y nginx openssl

COPY /tools/setup.sh /nginx_setup.sh

CMD ["/nginx_setup.sh"]