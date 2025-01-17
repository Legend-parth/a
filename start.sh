#!/bin/bash

# Start noVNC server pointing to VNC server
/opt/novnc/utils/launch.sh --vnc localhost:5900 &

# Start x11vnc server with pre-configured password
x11vnc -forever -usepw -allow 127.0.0.1 -create
