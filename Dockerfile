FROM ubuntu:22.04

# Set timezone and non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

# Preconfigure timezone package and install all required packages
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt update && \
    apt install -y tzdata wget curl nano git neofetch qemu qemu-utils x11vnc novnc websockify && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt clean

# Add startup command for X11VNC and noVNC
CMD ["x11vnc", "-display", ":0", "-forever", "-shared", "-rfbport", "5900", "-bg"] && \
    ["websockify", "--web", "/usr/share/novnc", "6080", "localhost:5900"]
