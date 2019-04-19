ARG BASE_IMAGE="openjdk:8"
FROM ${BASE_IMAGE}

RUN apt-get update && apt-get install -y \
    # common dev tools
    vim htop git openssh-client zsh tmux wget curl w3m less ssh netcat-openbsd dnsutils bc locales \
    # common x11 client dependencies
    firefox-esr libdbus-glib-1-2 libxtst-dev \
    # better fonts
    ttf-wqy-microhei \
    # certificate
    ca-certificates \
    # some ides need machine-id info like atom/eclipse
    dbus && dbus-uuidgen > /etc/machine-id && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i '/^#.* en_US.UTF-8 /s/^#//' /etc/locale.gen && locale-gen

RUN useradd -m dev && \
    chsh -s /bin/zsh dev && \
    mkdir /code && \
    chown dev:dev /code -R

USER dev
RUN git clone -b personalize https://github.com/teanoon/oh-my-zsh.git ~/.oh-my-zsh && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    ln -s ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    ln -s ~/.oh-my-zsh/templates/tmux.conf.template.2 ~/.tmux.conf
WORKDIR /code
