FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
    python3
RUN apt-get install -y python3-pip

RUN useradd -m dev && chmod 777 /tmp -R
USER dev
RUN pip3 install --upgrade --user awscli
RUN echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
ADD .aws /home/dev/.aws

USER root
RUN apt-get install -y groff less
USER dev
