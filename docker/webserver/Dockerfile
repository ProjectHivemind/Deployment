# Build
FROM golang:alpine as build

RUN apk update && apk add git

WORKDIR /go/src/

RUN git clone https://github.com/ProjectHivemind/WebServer webserver

WORKDIR /go/src/webserver

RUN GOOS=linux go build ./cmd/server.go

# Prod
FROM alpine as prod

RUN mkdir templates

COPY --from=build /go/src/webserver/server .
COPY --from=build /go/src/webserver/templates/ templates/

CMD ["./server"]
