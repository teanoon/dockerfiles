FROM ubuntu:16.04

MAINTAINER teanoon anticipationvu@gmail.com

RUN apt-get update && apt-get -y --no-install-recommends install \
    # portal tools
    privoxy \
    # network measurement
    mtr-tiny iperf iputils-ping \
    # common tools
    vim htop git openssh-client zsh tmux wget curl w3m less ssh netcat-openbsd \
    # certificate
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*
