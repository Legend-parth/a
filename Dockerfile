FROM ubuntu:22.04

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    wget \
    curl \
    nano \
    python3 \
    shellinabox \
    && apt-get clean

# Set up SSH service
RUN mkdir -p /var/run/sshd

# Set root password for SSH
RUN echo 'root:1234' | chpasswd

# Allow root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Prevent SSH session from being automatically terminated
RUN echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
RUN echo "ClientAliveCountMax 120" >> /etc/ssh/sshd_config

# Expose SSH and ShellInABox port
EXPOSE 22
EXPOSE 4200

# Start SSH service and Shellinabox
RUN service ssh start && /usr/bin/shellinaboxd --no-beep --background --port=4200 --service=/:SSH
