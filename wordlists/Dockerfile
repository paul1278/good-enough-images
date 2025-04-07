FROM python:3
WORKDIR /opt

RUN pip install bopscrk
RUN git clone https://github.com/t3l3machus/psudohash && \
    cd ./psudohash && \
    chmod +x psudohash.py && \
    ln -s /opt/psudohash/psudohash.py /usr/local/bin/psudohash