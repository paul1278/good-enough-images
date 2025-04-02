#FROM python:3
#RUN git clone https://github.com/lgandx/Responder.git
#WORKDIR /Responder
#RUN pip install -r requirements.txt
#RUN ln -s /Responder/Responder.py /usr/local/bin/responder.py
#RUN apt update && apt install -y iproute2 gcc-mingw-w64-x86-64
#RUN pip install pycryptodomex six
#RUN cd tools \
#    && x86_64-w64-mingw32-gcc ./MultiRelay/bin/Runas.c -o ./MultiRelay/bin/Runas.exe -municode -lwtsapi32 -luserenv \
#    && x86_64-w64-mingw32-gcc ./MultiRelay/bin/Syssvc.c -o ./MultiRelay/bin/Syssvc.exe -municode

FROM debian:10
RUN apt update && apt install -y iproute2 gcc-mingw-w64-x86-64 python3 python-crypto git
RUN git clone https://github.com/lgandx/Responder.git
WORKDIR /Responder
RUN apt install -y python3-pip
RUN pip3 install -r requirements.txt
RUN ln -s /Responder/Responder.py /usr/local/bin/responder.py
RUN pip3 install pycryptodomex
RUN cd tools \
    && x86_64-w64-mingw32-gcc ./MultiRelay/bin/Runas.c -o ./MultiRelay/bin/Runas.exe -municode -lwtsapi32 -luserenv \
    && x86_64-w64-mingw32-gcc ./MultiRelay/bin/Syssvc.c -o ./MultiRelay/bin/Syssvc.exe -municode