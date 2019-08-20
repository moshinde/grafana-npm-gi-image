#!/bin/sh
cd /go/src/github.com/grafana/grafana
/go/bin/bra run &
yarn install --pure-lockfile
yarn watch