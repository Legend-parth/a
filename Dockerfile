# Use a lightweight Ubuntu image
FROM ubuntu:22.04

# Set environment variables for non-interactive installations
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

# Install necessary packages and set up SSHX
RUN apt update && apt install -y wget curl nano git neofetch qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
RUN curl -sSf https://sshx.io/get | sh

# Expose KVM device and other privileges
CMD ["sh", "-c", "modprobe kvm && modprobe kvm_intel && sshx -q"]

