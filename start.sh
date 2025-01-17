#!/bin/bash

# Start noVNC server pointing to VNC server
/opt/novnc/utils/novnc_proxy --vnc localhost:5900 &

# Start x11vnc server with pre-configured password
x11vnc -forever -usepw -create
