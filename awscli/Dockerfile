FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
    python3 groff less python3-pip wget curl htop && \
    apt-get clean

RUN pip3 install awscli
RUN useradd -m dev && chmod 777 /tmp -R
USER dev

ENTRYPOINT ["aws"]
