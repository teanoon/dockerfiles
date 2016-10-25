FROM jenkins:1.651.3

USER root

ENV DOCKER_VERSION 1.11.2
ENV COMPOSE_VERSION 1.8.1

RUN curl -sSL https://get.docker.com/ | sh && \
    apt-get purge -y docker-engine && \
    apt-get install -y docker-engine=${DOCKER_VERSION}-0~jessie

RUN curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    docker-compose -v

RUN usermod -aG docker jenkins

USER jenkins
