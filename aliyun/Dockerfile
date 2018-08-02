FROM golang:1.10

RUN mkdir -p $GOPATH/src/github.com/aliyun
RUN cd $GOPATH/src/github.com/aliyun && \
    git clone http://github.com/aliyun/aliyun-cli.git && \
    git clone http://github.com/aliyun/aliyun-openapi-meta.git
RUN cd $GOPATH/src/github.com/aliyun/aliyun-cli && \
    make install

RUN useradd -m dev
USER dev

ENTRYPOINT ["aliyun"]
