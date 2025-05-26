FROM ubuntu:24.04
RUN apt update && apt install -y ca-certificates curl
RUN curl -fsSL https://miktex.org/download/key | tee /usr/share/keyrings/miktex-keyring.asc
RUN echo "deb [signed-by=/usr/share/keyrings/miktex-keyring.asc] https://miktex.org/download/ubuntu noble universe" | tee /etc/apt/sources.list.d/miktex.list
RUN apt update && apt install -y miktex
RUN miktexsetup --shared=yes finish
RUN initexmf --admin --set-config-value [MPM]AutoInstall=1