FROM golang:1.16.3-alpine3.13
HEALTHCHECK CMD "aaisp-exporter"
RUN adduser -h /go/src/app -D aaisp
USER aaisp
WORKDIR /go/src/app
COPY . /go/src/app
RUN go get -d -v ./... && \
    go build -o /go/bin/aaisp-exporter
CMD ["/go/bin/aaisp-exporter"]
EXPOSE 9902/tcp
