FROM debian:bullseye

RUN apt update -y && apt install -y mariadb-server

COPY /tools/setup.sh /mariadb_setup.sh

CMD ["/mariadb_setup.sh"]