FROM python:3
RUN apt update && apt install -y dirb && rm -rf /var/lib/apt/lists/*
RUN pip install --break-system-packages git-dumper
RUN wget https://github.com/sullo/nikto/archive/refs/tags/2.5.0.tar.gz && \
    tar -xzf 2.5.0.tar.gz && \
    rm 2.5.0.tar.gz && \
    mv nikto-2.5.0 nikto && \
    cd nikto/program && \
    chmod +x nikto.pl && \
    ln -s $(pwd)/nikto.pl /usr/local/bin/nikto