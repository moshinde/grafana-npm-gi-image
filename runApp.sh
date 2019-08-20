#!/bin/sh
cd /go/src/github.com/grafana/grafana
go get -v github.com/Unknwon/bra
go run build.go setup
go run build.go build
/go/bin/bra run &
npm install -g yarn
yarn install --pure-lockfile
yarn watch