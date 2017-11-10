FROM ubuntu:14.04

MAINTAINER teanoon anticipationvu@gmail.com

RUN apt-get update && apt-get -y --no-install-recommends install \
    supervisor \
    # portal tools
    python-pip privoxy \
    # network measurement
    mtr-tiny iperf \
    curl && \
    rm -rf /var/lib/apt/lists/*

RUN pip install shadowsocks

RUN locale-gen "en_US.UTF-8"

ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
CMD ["/entrypoint.sh"]
