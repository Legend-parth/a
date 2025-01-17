#!/bin/bash

# Set the VNC password non-interactively
VNC_PASSWORD_FILE="/root/.vnc/passwd"
if [ ! -f "$VNC_PASSWORD_FILE" ]; then
    mkdir -p /root/.vnc
    echo "your_vnc_password" | x11vnc -storepasswd - $VNC_PASSWORD_FILE
    chmod 600 $VNC_PASSWORD_FILE
fi

# Start a virtual display (Xvfb)
Xvfb :0 -screen 0 1280x1024x24 &

# Start the x11vnc server
x11vnc -forever -usepw -shared -display :0 &

# Start the noVNC web interface
/opt/noVNC/utils/launch.sh --vnc localhost:5900 --listen 6080 &

# Keep the container running
tail -f /dev/null
