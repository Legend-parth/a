#!/bin/bash

# Set the VNC password
VNC_PASSWORD_FILE="/root/.vnc/passwd"
if [ ! -f "$VNC_PASSWORD_FILE" ]; then
    mkdir -p /root/.vnc
    echo "Legends@2025" | x11vnc -storepasswd - $VNC_PASSWORD_FILE
    chmod 600 $VNC_PASSWORD_FILE
fi

# Start a virtual display (Xvfb)
Xvfb :0 -screen 0 1280x1024x24 &

# Start the x11vnc server
x11vnc -forever -usepw -shared -display :0 &

# Start noVNC server
/opt/noVNC/utils/novnc_proxy --vnc localhost:5900 --listen 6080 &

# Start ttyd for terminal access
ttyd -p 6080 bash &
# Keep the container running
tail -f /dev/null
