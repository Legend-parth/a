FROM ubuntu:22.04
RUN apt update && apt install wget curl nano -y
RUN curl -sSf https://sshx.io/get | sh

CMD sshx -q > output.txt 2>&1 &
CMD sleep 2 && cat output.txt
