ARG BASE_IMAGE="openjdk:8"
FROM ${BASE_IMAGE}

USER root

ARG MONGO_VERSION=3.2.18
RUN curl -O https://downloads.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz && \
    curl -O https://downloads.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz.sha256 && \
    sha256sum -c mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz.sha256 && \
    rm mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz.sha256 && \
    tar xzf mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz && rm mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz && \
    mv mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION} mongodb

ARG SCALA_VERSION=1.1.0
RUN curl -OL https://github.com/sbt/sbt/releases/download/v${SCALA_VERSION}/sbt-${SCALA_VERSION}.tgz && \
    tar xzf sbt-${SCALA_VERSION}.tgz && rm sbt-${SCALA_VERSION}.tgz

ADD debian-sources.list /etc/apt/sources.list.d/buster.list
ADD apt-preferences /etc/apt/preferences
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y --no-install-recommends \
    # common dev tools
    vim htop git openssh-client zsh tmux wget curl w3m less ssh netcat-openbsd dnsutils bc \
    # common x11 client dependencies
    google-chrome-stable libgtk-3-0 libdbus-glib-1-2 libxtst-dev \
    # java source
    openjdk-8-source \
    # python
    python-dev \
    # pillow
    libtiff5-dev libjpeg62-turbo-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev gifsicle \
    # mongo
    libssl1.1 libssl-dev \
    # better fonts
    ttf-wqy-microhei \
    # certificate
    ca-certificates \
    # some ides need machine-id info like atom/eclipse
    dbus && dbus-uuidgen > /etc/machine-id && \
    rm -rf /var/lib/apt/lists/*

RUN if [ ! -d /home/dev ]; then useradd -m dev; fi && \
    chsh -s /bin/zsh dev && \
    if [ ! -d /code ]; then mkdir /code; fi && \
    chown dev:dev /code -R

USER dev
RUN git clone -b personalize https://github.com/teanoon/oh-my-zsh.git ~/.oh-my-zsh && \
    ln -s ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    ln -s ~/.oh-my-zsh/templates/tmux.conf.template.1 ~/.tmux.conf
ENV PATH="/mongodb/bin:/sbt/bin:${PATH}"
WORKDIR /code
