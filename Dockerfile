FROM ubuntu:22-04
RUN apt update && apt install wget curl nano -y
RUN curl -sSf https://sshx.io/get | sh
RUN sshx -q > output.txt 2>&1 &
RUN sleep 2 && cat output.txt
