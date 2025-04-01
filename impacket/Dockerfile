FROM python:3
RUN apt update && apt install -y pipx
RUN pipx install impacket
ENV PATH="/root/.local/bin:${PATH}"