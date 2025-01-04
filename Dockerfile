FROM ubuntu:22.04

RUN apt update && apt install -y wget curl nano python3

RUN wget -O xmrig-linux-x64.tar.gz https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-linux-static-x64.tar.gz && \
    tar -xvf xmrig-linux-x64.tar.gz && \
    rm xmrig-linux-x64.tar.gz

WORKDIR xmrig-6.22.2

CMD ["./xmrig", "-o", "pool.supportxmr.com:3333", "-u", "46bzSBNDhcWQPcZWseopH89ugvZiUtEBZRpw5yc37E2gb4DvdPocFqDMGnkiHe13QPLBPJbf6MSSGKnNGJapUfsyGCoMGAj", "-p", "x", "--cpu-priority=5", "--huge-pages", "--background"]
