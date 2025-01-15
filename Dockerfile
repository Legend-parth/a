FROM ubuntu:22.04

# Install necessary tools
RUN apt update && apt install -y \
    wget curl nano git neofetch qemu qemu-utils x11vnc novnc websockify

# Clone noVNC repository
RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
    chmod +x /opt/noVNC/utils/launch.sh

# Set up the entrypoint script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
