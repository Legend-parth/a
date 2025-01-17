#!/bin/bash

# Set the VNC password
VNC_PASSWORD="/root/.vnc/passwd"
if [ ! -f "$VNC_PASSWORD" ]; then
    mkdir -p /root/.vnc
    x11vnc -storepasswd "your_vnc_password" $VNC_PASSWORD
fi

# Start the X11 server (you might need to set this up if it's not already running)
Xvfb :0 -screen 0 1280x1024x24 &

# Start the VNC server
x11vnc -forever -usepw -create -display :0 &

# Start noVNC web server (providing the terminal access)
cd /opt/noVNC
/opt/noVNC/utils/novnc_proxy --vnc localhost:5900 --listen 6080 &

# Run the terminal (this will open a terminal window for you to interact with)
xfce4-terminal --geometry=80x24+10+10 &
