#!/bin/bash

# Start noVNC server
/opt/noVNC/utils/novnc_proxy --vnc localhost:5900 &

# Start x11vnc server with pre-configured password
x11vnc -forever -usepw -create
