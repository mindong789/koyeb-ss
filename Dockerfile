FROM v2fly/v2fly-core:latest

# 拷贝配置文件
COPY config.json /etc/v2ray/config.json

EXPOSE 16823/tcp
EXPOSE 16823/udp

ENTRYPOINT ["v2ray", "-config", "/etc/v2ray/config.json"]
