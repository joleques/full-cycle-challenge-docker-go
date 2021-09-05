FROM golang:1.17.0 as builder

WORKDIR /go/src/github.com/joleques/full-cycle-challenge-docker-go

COPY ./hello.go .

RUN go build -ldflags "-s -w" hello.go

FROM scratch

COPY --from=builder /go/src/github.com/joleques/full-cycle-challenge-docker-go .

CMD [ "./hello" ]
