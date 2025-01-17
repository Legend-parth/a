FROM ubuntu:22.04

# Set timezone to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

# Install required packages
RUN apt update && \
    apt install -y tzdata wget curl nano git neofetch qemu qemu-utils x11vnc novnc websockify xfce4-terminal ttyd && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt clean

# Set up noVNC and dependencies
RUN mkdir -p /opt/noVNC && \
    git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
    chmod +x /opt/noVNC/utils/novnc_proxy

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose necessary ports
EXPOSE 5900 6080

# Set default command
CMD ["/start.sh"]
