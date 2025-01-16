FROM ubuntu:22.04

# Set timezone and non-interactive frontend

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

# Preconfigure timezone package and install required packages

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt update && apt install -y tzdata wget curl nano git neofetch qemu qemu-utils x11vnc novnc websockify && dpkg-reconfigure --frontend noninteractive tzdata && apt clean

Copy the startup script

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start the services using the startup script

CMD ["/start.sh"]

