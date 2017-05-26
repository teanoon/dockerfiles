FROM openjdk:8u121

RUN apt-get update && apt-get install -y --force-yes --no-install-recommends \
    # common dev tools
    vim htop git openssh-client zsh tmux wget curl w3m less && \
    apt-get clean

RUN useradd -m dev && \
    chsh -s /bin/zsh dev
USER dev
RUN git clone -b personalize https://github.com/teanoon/oh-my-zsh.git ~/.oh-my-zsh && \
    ln -s ~/.oh-my-zsh/templates/zshrc.template ~/.zshrc && \
    ln -s ~/.oh-my-zsh/templates/tmux.conf.template ~/.tmux.conf

WORKDIR /home/dev
