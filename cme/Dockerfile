FROM ubuntu:22.04
RUN apt update && apt install -y unzip wget python3
RUN wget https://github.com/byt3bl33d3r/CrackMapExec/releases/download/v5.4.0/cme-ubuntu-latest-3.10.zip \
    && unzip cme-ubuntu-latest-3.10.zip \
    && rm cme-ubuntu-latest-3.10.zip \
    && chmod +x cme \
    && mv cme /usr/local/bin/cme