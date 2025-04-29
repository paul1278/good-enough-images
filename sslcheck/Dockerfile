FROM ubuntu:24.04
ENV TESTSSL_INSTALL_DIR=/opt/testssl.sh.d
RUN apt update && apt install -y wget bsdmainutils unzip net-tools dnsutils 
RUN wget https://github.com/testssl/testssl.sh/archive/refs/tags/v3.2.0.zip -O /tmp/testssl.sh.zip && \
    unzip /tmp/testssl.sh.zip && mv testssl.sh-3.2.0 /opt/testssl.sh.d/ && ln /opt/testssl.sh.d/testssl.sh /usr/local/bin/testssl.sh