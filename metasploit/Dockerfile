FROM ubuntu:24.04
RUN apt update && apt install -y curl gpg && rm -rf /var/lib/apt/lists/*
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall && \
    rm msfinstall && \
    rm -rf /var/lib/apt/lists/*