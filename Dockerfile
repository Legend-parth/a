FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y qemu qemu-utils x11vnc novnc websockify xfce4-terminal git && \
    apt-get clean

RUN curl -sSf https://sshx.io/get | sh
CMD cd ~ && sshx -q
