FROM v2fly/v2fly-core:latest

# 拷贝配置文件到默认路径
COPY config.json /etc/v2ray/config.json

# 端口
EXPOSE 16823/tcp
EXPOSE 16823/udp

# 使用 run 命令启动
ENTRYPOINT ["v2ray", "run", "-c", "/etc/v2ray/config.json"]
