FROM golang:1.8

RUN go get -v github.com/asciimoo/wuzz

ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
