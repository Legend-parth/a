# Use a lightweight Ubuntu image
FROM ubuntu:22.04

# Set environment variables for non-interactive installations
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

# Install necessary packages
RUN apt update && \
    apt install -y tzdata wget curl nano git neofetch \
                   qemu qemu-utils x11vnc novnc websockify xfce4-terminal && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt clean

# Set up noVNC
RUN mkdir -p /opt/noVNC && \
    git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
    chmod +x /opt/noVNC/utils/novnc_proxy

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose necessary ports
EXPOSE 5900 6080

# Start the VNC and noVNC services
CMD ["/start.sh"]
