FROM openjdk:8

RUN echo "deb http://packages.linuxmint.com debian import" | tee /etc/apt/sources.list.d/firefox.list && \
    apt-get update && apt-get install -y --force-yes --no-install-recommends \
    # common dev tools
    vim htop git openssh-client zsh tmux wget curl w3m less ssh netcat-openbsd dnsutils \
    # common x11 client dependencies
    firefox libdbus-glib-1-2 libxtst-dev \
    # python
    python-dev \
    # better fonts
    ttf-wqy-microhei \
    # certificate
    ca-certificates \
    # some ides need machine-id info like atom/eclipse
    dbus && dbus-uuidgen > /etc/machine-id && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m dev && chsh -s /bin/zsh dev && \
    mkdir /code && \
    chown dev:dev /code -R

ARG MONGO_VERSION=3.2.18
RUN curl -O https://downloads.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz && \
    curl -O https://downloads.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz.sha256 && \
    sha256sum -c mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz.sha256 && \
    rm mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz.sha256 && \
    tar xzf mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz && rm mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION}.tgz && \
    mv mongodb-linux-x86_64-ubuntu1604-${MONGO_VERSION} mongodb && \
    chown dev:dev mongodb -R

ARG SCALA_VERSION=1.1.0
RUN wget https://github.com/sbt/sbt/releases/download/v${SCALA_VERSION}/sbt-${SCALA_VERSION}.tgz && \
    tar xzf sbt-${SCALA_VERSION}.tgz && rm sbt-${SCALA_VERSION}.tgz

USER dev

RUN git clone -b personalize https://github.com/teanoon/oh-my-zsh.git ~/.oh-my-zsh && \
    ln -s ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    ln -s ~/.oh-my-zsh/templates/tmux.conf.template.1 ~/.tmux.conf
RUN echo "export PATH=/mongodb/bin:/sbt/bin:$PATH" >> ~/.zshrc
WORKDIR /code
