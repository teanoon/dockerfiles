FROM node:7.7

RUN apt-get update && apt-get install -y software-properties-common && \
    echo "deb http://packages.linuxmint.com debian import" | tee /etc/apt/sources.list.d/firefox.list && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/java8.list && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/java8.list && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
    # start installing dependencies
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
    # common dev tools
    vim htop openssh-client zsh tmux wget curl w3m less \
    # common x11 client dependencies
    firefox \
    # better fonts
    ttf-wqy-microhei \
    # certificate
    ca-certificates \
    # jdk
    oracle-java8-installer \
    # some ides need machine-id info like atom/eclipse
    dbus gconf2 gconf-service libgtk2.0-0 libnotify4 libxtst6 libnss3 gvfs-bin xdg-utils libxss1 libasound2 libxkbfile1 && \
    dbus-uuidgen > /etc/machine-id && \
    chsh -s /bin/zsh node && \
    mkdir /code && chown node:node /code -R
    # remove apt

# additional dependencies
RUN apt-get install -y --force-yes --no-install-recommends \
    qt5-default

USER node
RUN git clone -b personalize https://github.com/teanoon/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN echo "export ANDROID_HOME=${HOME}/Android/Sdk" >> ~/.zshrc && \
    echo "export PATH=${PATH}:${HOME}/Android/Sdk/tools:${HOME}/Android/Sdk/tools/bin:${HOME}/Android/Sdk/platform-tools" >> ~/.zshrc
WORKDIR /code
