FROM python:3
RUN apt update && apt install -y wget unzip && rm -rf /var/lib/apt/lists/*
RUN pip install --break-system-packages git-dumper
RUN wget https://github.com/sullo/nikto/archive/refs/tags/2.5.0.zip && \
    unzip 2.5.0.zip && \
    rm 2.5.0.zip && \
    mv nikto-2.5.0 nikto && \
    cd nikto/program && \
    chmod +x nikto.pl && \
    ln -s $(pwd)/nikto.pl /usr/local/bin/nikto