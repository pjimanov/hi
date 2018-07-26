FROM golang:alpine as base
COPY hi.go $GOPATH/src/hi/
WORKDIR $GOPATH/src/hi/
RUN go build -o /go/bin/hi
FROM scratch
COPY --from=base /go/bin/hi /go/bin/hi
ENTRYPOINT ["/go/bin/hi"]