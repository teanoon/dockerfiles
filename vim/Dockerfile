FROM ubuntu:14.04

MAINTAINER teanoon <anticipationvu@gmail.com>

RUN apt-get update && apt-get install -y --force-yes --no-install-recommends \
    # plugin dependencies
    build-essential cmake python-dev python3-dev \
    # vim 8
    libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev \
    ruby-dev lua5.1 lua5.1-dev libperl-dev \
    # common dev tools
    htop git openssh-client zsh tmux wget curl w3m less && \
    # remove old vim
    apt-get remove -y vim vim-runtime gvim && \
    apt-get clean

# install latest vim
RUN cd ~ && git clone https://github.com/vim/vim.git && cd vim && \
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp=yes \
                --enable-pythoninterp=yes \
                --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
                --enable-python3interp=yes \
                --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu \
                --enable-perlinterp=yes \
                --enable-luainterp=yes \
                --enable-cscope --prefix=/usr && \
    make VIMRUNTIMEDIR=/usr/share/vim/vim80 && \
    make install && \
    update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1 && \
    update-alternatives --set editor /usr/bin/vim && \
    update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1 && \
    update-alternatives --set vi /usr/bin/vim && \
    rm ~/vim -Rf

RUN useradd -m dev && \
    chsh -s /bin/zsh dev
USER dev

# install plugins
RUN git clone -b personalize git://github.com/teanoon/oh-my-zsh.git ~/.oh-my-zsh && \
    ln -s ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    ln -s ~/.oh-my-zsh/templates/vimrc.template ~/.vimrc && \
    mkdir -p ~/.vim/bundle && \
    git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall

# build additional ycm_core
ENV CLANG_URL http://releases.llvm.org/3.9.0/clang+llvm-3.9.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
ENV CLANG_FILE_NAME clang+llvm-3.9.0-x86_64-linux-gnu-ubuntu-14.04

RUN cd ~/.vim && \
    wget ${CLANG_URL} && tar xf ${CLANG_FILE_NAME}.tar.xz && mv ${CLANG_FILE_NAME} clang_llvm && rm ${CLANG_FILE_NAME}.tar.xz && \
    mkdir ycm_build && cd ycm_build && \
    cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/.vim/clang_llvm . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp && \
    cmake --build . --target ycm_core --config Release
