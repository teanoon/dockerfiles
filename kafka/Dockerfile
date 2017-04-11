FROM openjdk:8u121

RUN apt-get update && apt-get install -y --force-yes --no-install-recommends \
    wget git htop vim less tmux zsh && \
    rm -rf /var/lib/apt/lists/*
   
RUN useradd -m dev && chsh -s /bin/zsh dev && \
    mkdir /code && \
    chown dev:dev /code -R 

USER dev

RUN cd ~/ && \
    wget http://apache.mirror.vexxhost.com/kafka/0.10.2.0/kafka_2.11-0.10.2.0.tgz -O kafka.tgz && \
    tar -xf kafka.tgz && \
    mv kafka_2.11-0.10.2.0 kafka && \
    rm kafka.tgz

RUN git clone -b personalize https://github.com/teanoon/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    echo "export PATH=${PATH}:${HOME}/kafka/bin" >> ~/.zshrc && \
    sed -i 's/^broker/# broker/g' ~/kafka/config/server.properties
WORKDIR /home/dev/kafka
