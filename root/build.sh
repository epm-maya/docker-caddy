#!/bin/bash
set -ex

cd /root

go version

pushd caddy

go mod init caddy

go get -d -v github.com/caddyserver/caddy/v2@v2.4.0

go mod tidy

CGO_ENABLED=0 go build -v -ldflags "-w -s" -trimpath

popd

