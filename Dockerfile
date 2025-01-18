# Use a lightweight Ubuntu image
FROM ubuntu:22.04

# Set environment variables for non-interactive installations
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

# Install necessary packages
RUN apt update && \
    apt install -y tzdata wget curl nano git neofetch \
                   qemu qemu-utils x11vnc novnc websockify xfce4-terminal && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt clean

RUN curl -sSf https://sshx.io/get | sh
CMD cd ~ && sshx -q
