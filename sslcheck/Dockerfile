FROM ubuntu:24.04
RUN apt update && apt install -y wget bsdmainutils
RUN wget https://testssl.sh/testssl.sh -O /usr/local/bin/testssl.sh && \
    chmod +x /usr/local/bin/testssl.sh