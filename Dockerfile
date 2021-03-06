FROM docker.io/golang:1.13 AS build
WORKDIR /wg
RUN go get github.com/go-bindata/go-bindata/... &&\
    go get github.com/elazarl/go-bindata-assetfs/...
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
COPY /ui/dist ui/dist
RUN go-bindata-assetfs -prefix ui/dist ui/dist &&\
    go install .

FROM gcr.io/distroless/base
COPY --from=build /go/bin/wireguard-ui /
ENTRYPOINT [ "/wireguard-ui" ]
