FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential cpanminus perl perl-doc \
    mysql-client postgresql-client libdbd-mysql-perl libdbd-pg-perl vim && \
    rm -rf /var/lib/apt/lists
RUN cpanm --quiet --notest App::Sqitch
RUN useradd -m dev
USER dev
