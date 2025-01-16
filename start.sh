#!/bin/bash

# Set a VNC password
mkdir -p ~/.vnc
echo "yourpassword" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Start x11vnc
x11vnc -display :0 -forever -shared -rfbport 5900 -passwdfile ~/.vnc/passwd -bg

# Start noVNC
websockify --web /usr/share/novnc 6080 localhost:5900
