ARG BASE_IMAGE=openjdk:8
FROM $BASE_IMAGE

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

USER dev

RUN git clone -b personalize https://github.com/teanoon/oh-my-zsh.git ~/.oh-my-zsh && \
    ln -s ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    ln -s ~/.oh-my-zsh/templates/tmux.conf.template.1 ~/.tmux.conf
WORKDIR /code
