FROM debian:stretch

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sqitch libdbd-pg-perl postgresql-client libdbd-mysql-perl mysql-client && \
    rm -rf /var/lib/apt/lists
RUN useradd -m dev
USER dev
