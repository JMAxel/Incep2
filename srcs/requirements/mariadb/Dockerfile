FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/create.sql /etc/mysql/create.sql
COPY tools/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

CMD ["./script.sh"]

