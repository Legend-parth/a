FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y qemu qemu-utils x11vnc novnc websockify xfce4-terminal git && \
    apt-get clean

# Clone noVNC and websockify
RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
    chmod +x /opt/noVNC/utils/launch.sh

# Set up the environment
WORKDIR /opt/noVNC
EXPOSE 6080

CMD ["./utils/launch.sh", "--vnc", "localhost:5900"]
