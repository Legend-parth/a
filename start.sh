#!/bin/bash

# Start X11 VNC server in the background
x11vnc -forever -usepw -create &

# Start noVNC server
/opt/noVNC/utils/launch.sh --vnc localhost:5900 &

# Keep the container running for terminal access
tail -f /dev/null
