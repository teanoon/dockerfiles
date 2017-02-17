FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends software-properties-common python-software-properties && \
    apt-get clean

RUN add-apt-repository ppa:noobslab/apps && \
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends cool-retro-term x11-xserver-utils && \
    apt-get clean
