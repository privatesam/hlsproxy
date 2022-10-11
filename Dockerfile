FROM debian:stable-slim


ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp

EXPOSE 80

RUN \
apt-get update && apt-get upgrade -y && \
apt-get install -y \
unzip \
wget \
nano \
tzdata && \
ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime && \
dpkg-reconfigure --frontend noninteractive tzdata && \
apt-get autoremove -y && \


wget -o - https://www.hls-proxy.com/downloads/8.4.8/hls-proxy-8.4.8.linux-x64.zip -O hlsproxy.zip && \
unzip hlsproxy.zip -d /opt/hlsp/ && \

chmod +x /opt/hlsp/hls-proxy

CMD ["/opt/hlsp/hls-proxy"]
