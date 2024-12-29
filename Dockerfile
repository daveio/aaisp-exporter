FROM golang:1.16.3-alpine3.13

WORKDIR /go/src/app

ADD . /go/src/app

RUN go get -d -v ./... && \
    go build -o /go/bin/aaisp-exporter

CMD ["/go/bin/aaisp-exporter"]

EXPOSE 9902/tcp
