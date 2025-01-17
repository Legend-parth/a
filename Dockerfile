FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt update && apt install -y tzdata wget curl nano git neofetch qemu qemu-utils x11vnc novnc websockify python3 \
    && ln -fs /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt clean

COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /root/.vnc && \
    echo "yourpassword" | x11vnc -storepasswd - /root/.vnc/passwd

EXPOSE 5900 6080

CMD ["/start.sh"]
