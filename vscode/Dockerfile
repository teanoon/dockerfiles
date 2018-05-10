FROM node:9

RUN apt-get update && apt-get install -y --no-install-recommends wget curl git
RUN apt-get install -y --no-install-recommends ca-certificates
RUN curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" -o vscode.deb
RUN apt-get install -y --no-install-recommends libc6-dev libgtk2.0-0 libgtk-3-0 libpango-1.0-0 libcairo2 libfontconfig1 libgconf2-4 libnss3 libasound2 libxtst6 unzip libglib2.0-bin libcanberra-gtk-module libgl1-mesa-glx build-essential gettext libstdc++6 software-properties-common xterm automake libtool autogen nodejs libnotify-bin aspell aspell-en htop emacs mono-complete gvfs-bin libxss1 rxvt-unicode-256color x11-xserver-utils vim libxkbfile1
RUN dpkg -i vscode.deb
RUN apt-get install -y --no-install-recommends zsh
RUN apt-get install -y --no-install-recommends tmux dbus && dbus-uuidgen > /etc/machine-id

RUN chsh -s /bin/zsh node && \
    mkdir code && \
    chown node:node /code -R
ENV PATH="/code/node_modules/.bin:${PATH}"

USER node 
RUN git clone -b personalize https://github.com/teanoon/oh-my-zsh.git ~/.oh-my-zsh
WORKDIR /code
CMD [ "/usr/bin/code", "-w", "." ]
