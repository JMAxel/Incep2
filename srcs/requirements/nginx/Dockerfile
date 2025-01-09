FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y nginx openssl

COPY /conf/default /etc/nginx/sites-available/.
COPY /tools/genkey.sh /

RUN chmod +x ./genkey.sh
RUN ./genkey.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
