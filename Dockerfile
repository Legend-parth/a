# Start with a basic Ubuntu 22.04 image
FROM ubuntu:22.04

# Update and install necessary tools
RUN apt update && apt install -y \
    curl \
    wget \
    qemu-kvm \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virt-manager \
    && apt clean

# Download Windows 10 ISO
RUN wget --content-disposition --no-check-certificate "https://go.microsoft.com/fwlink/?LinkId=760868" -O /windows10.iso

# Install sshx (if required in your environment)
RUN curl -sSf https://sshx.io/get | sh

# Default command to run sshx for your container environment
CMD cd ~ && sshx -q
