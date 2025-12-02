FROM shadowsocks/shadowsocks-libev

USER root

# 安装 wget 以便下载 v2ray-plugin
RUN apt-get update && apt-get install -y wget

# 下载并安装 v2ray-plugin
RUN wget -O /tmp/v2ray-plugin.tar.gz https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.2/v2ray-plugin-linux-amd64-v1.3.2.tar.gz && \
    tar -xf /tmp/v2ray-plugin.tar.gz -C /usr/bin/ && \
    mv /usr/bin/v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin && \
    chmod +x /usr/bin/v2ray-plugin && \
    rm /tmp/v2ray-plugin.tar.gz

USER nobody

# 启动命令：使用环境变量配置，强制监听 0.0.0.0
# 注意：Koyeb 会自动注入 PORT 环境变量，我们将其传递给 ss-server
CMD exec ss-server \
    -s 0.0.0.0 \
    -p $PORT \
    -k $PASSWORD \
    -m $METHOD \
    --plugin v2ray-plugin \
    --plugin-opts "server;path=$PATH_URL"
