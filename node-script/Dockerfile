FROM node:9

RUN mkdir /node-script && \
    chown node:node /node-script -R
WORKDIR /node-script

USER node
ARG PUPPETEERVERSION="0.13.0"
RUN npm init -y && npm i \
    puppeteer@${PUPPETEERVERSION}

ENTRYPOINT [ "node" ]
