FROM node:11

RUN npm install -g fx
RUN apt-get update && apt-get -y --no-install-recommends install \
    # tools
    privoxy supervisor \
    # network measurement
    mtr-tiny iperf iputils-ping \
    # common tools
    vim htop git openssh-client zsh tmux wget curl w3m less ssh netcat-openbsd dnsutils strace \
    # certificate
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*
