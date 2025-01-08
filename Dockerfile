# Start with Ubuntu 22.04 base image
FROM ubuntu:22.04

# Set environment variables (Optional, you can specify more if needed)
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies for virtualization and SSHX
RUN apt update && apt install -y \
    wget \
    curl \
    nano \
    git \
    neofetch \
    qemu-kvm \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virt-manager \
    virtinst \
    qemu-system-x86 \
    unzip \
    && apt clean

# Install SSHX tool (for terminal sharing)
RUN curl -sSf https://sshx.io/get | sh

# Download a Windows ISO image or any other image you want to use for the VM
# For Windows, you can get a Windows 10 ISO link or any other version. Here, it's just an example.
RUN wget -O /tmp/windows.iso https://software-download.microsoft.com/pr/Win10_21H1_English_x64.iso

# Install necessary dependencies to enable nested virtualization (important for VM inside containers)
RUN modprobe kvm && modprobe kvm-intel

# Set up the VM creation environment (using virt-install or qemu)
RUN mkdir -p /var/lib/libvirt/images

# Example command to create a VM (this is a basic example, adapt to your needs)
# This will create a VM with the Windows ISO as the installation source
RUN virt-install \
    --name sshx-vm \
    --ram 8192 \
    --vcpus 4 \
    --disk path=/var/lib/libvirt/images/sshx-vm.qcow2,format=qcow2 \
    --os-type linux \
    --os-variant ubuntu20.04 \
    --network bridge=br0 \
    --graphics vnc \
    --cdrom /tmp/windows.iso \
    --import \
    --noautoconsole

# Start the SSHX tool, which is the entry point to access the environment
CMD cd ~ && sshx -q
