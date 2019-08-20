FROM avcosystems/golang-node:latest
RUN cd src && go get github.com/KamalGalrani/grafana-1; exit 0
RUN mv /go/src/github.com/KamalGalrani /go/src/github.com/grafana
RUN mv /go/src/github.com/grafana/grafana-1 /go/src/github.com/grafana/grafana
RUN export PATH=$PATH:/usr/local/go/bin
RUN export GOPATH=/go
COPY runApp.sh /go/src/github.com
RUN chmod 0755 /go/src/github.com/runApp.sh
WORKDIR /go/src/github.com/grafana/grafana
ENTRYPOINT ["sh", "/go/src/github.com/runApp.sh"]
EXPOSE 3000