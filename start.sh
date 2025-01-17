#!/bin/bash

# Start websockify and noVNC server
/opt/noVNC/utils/novnc_proxy --vnc localhost:5900 --listen 6080 &

# Start x11vnc server
x11vnc -forever -usepw -create -display :0
