FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server wget curl nano python3

RUN echo 'root:1234' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
RUN echo "ClientAliveCountMax 120" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
