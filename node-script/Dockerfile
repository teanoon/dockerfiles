FROM node:9

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt-get update && \
    apt-get install -y --no-install-recommends google-chrome-unstable libgconf-2-4 && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /src/*.deb
RUN mkdir /node-script && \
    chown node:node /node-script -R
WORKDIR /node-script

USER node
