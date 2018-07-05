ARG BASE_IMAGE="openjdk:8"
FROM ${BASE_IMAGE}

USER root

RUN echo "deb http://packages.linuxmint.com debian import" | tee /etc/apt/sources.list.d/firefox.list && \
    apt-get update && apt-get install -y --no-install-recommends --allow-unauthenticated \
    # common dev tools
    vim htop git openssh-client zsh tmux wget curl w3m less ssh netcat-openbsd dnsutils bc \
    # common x11 client dependencies
    firefox libdbus-glib-1-2 libxtst-dev \
    # java source
    openjdk-8-source \
    # python
    python-dev \
    # pillow
    libtiff5-dev libjpeg62-turbo-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev gifsicle \
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
    ln -s ~/.oh-my-zsh/templates/tmux.conf.template.2 ~/.tmux.conf
WORKDIR /code
