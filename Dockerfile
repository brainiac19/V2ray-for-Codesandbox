FROM ubuntu

RUN apt update -y && apt install -y wget unzip nginx supervisor qrencode net-tools

RUN mkdir -p /etc/mysql /usr/local/mysql

RUN wget -O /etc/mysql/config.json https://raw.githubusercontent.com/brainiac19/V2ray-for-Codesandbox/main/config.json

RUN wget -O /usr/local/mysql/entrypoint.sh https://raw.githubusercontent.com/brainiac19/V2ray-for-Codesandbox/main/entrypoint.sh

RUN wget -q -O /tmp/v2ray-linux-64.zip https://github.com/v2fly/v2ray-core/releases/download/v5.12.1/v2ray-linux-64.zip && \
    unzip -d /usr/local/mysql /tmp/v2ray-linux-64.zip && \
	mv /usr/local/mysql/v2ray /usr/local/mysql/mysql && \
    chmod a+x /usr/local/mysql/entrypoint.sh
