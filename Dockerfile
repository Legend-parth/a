FROM ubuntu:22.04

# Set timezone environment variable
ENV TZ=Asia/Kolkata

# Install required packages and noVNC
RUN apt update && apt install -y tzdata wget curl nano git neofetch qemu qemu-utils x11vnc novnc websockify python3 \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt clean

# Copy the startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set up VNC password (replace 'yourpassword' with the desired password)
RUN mkdir -p /root/.vnc && \
    echo "yourpassword" | x11vnc -storepasswd - /root/.vnc/passwd

# Expose necessary ports
EXPOSE 5900 6080

# Set the default command to run the startup script
CMD ["/start.sh"]
