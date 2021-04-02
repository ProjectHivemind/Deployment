# Build
FROM golang:alpine as build

RUN apk update && apk add git

WORKDIR /go/src/

RUN git clone https://github.com/ProjectHivemind/Teamserver teamserver

WORKDIR /go/src/teamserver/teamserver

RUN GOOS=linux go build ./cmd/hivemind/server.go

# Prod
FROM alpine:latest as prod

RUN mkdir config

COPY --from=build /go/src/teamserver/teamserver/server .

CMD ["./server config/config.yaml"]
