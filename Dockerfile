FROM shadowsocks/shadowsocks-libev

USER root

# 修正部分：使用 apk (Alpine包管理器) 替代 apt-get，并安装 wget 和 tar
RUN apk add --no-cache wget tar ca-certificates

# 下载并安装 v2ray-plugin
RUN wget -O /tmp/v2ray-plugin.tar.gz https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.2/v2ray-plugin-linux-amd64-v1.3.2.tar.gz && \
    tar -xf /tmp/v2ray-plugin.tar.gz -C /usr/bin/ && \
    mv /usr/bin/v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin && \
    chmod +x /usr/bin/v2ray-plugin && \
    rm /tmp/v2ray-plugin.tar.gz

USER nobody

# 启动命令保持不变
CMD exec ss-server \
    -s 0.0.0.0 \
    -p $PORT \
    -k $PASSWORD \
    -m $METHOD \
    --plugin v2ray-plugin \
    --plugin-opts "server;path=$PATH_URL"
