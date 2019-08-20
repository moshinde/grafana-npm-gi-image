FROM avcosystems/golang-node:latest
RUN cd src && go get github.com/KamalGalrani/grafana-1; exit 0 
ENV PATH=$PATH:/usr/local/go/bin \
    GOPATH=/go
COPY runApp.sh /go/src/github.com
RUN mv /go/src/github.com/KamalGalrani /go/src/github.com/grafana && \
    mv /go/src/github.com/grafana/grafana-1 /go/src/github.com/grafana/grafana && \
    chmod 0755 /go/src/github.com/runApp.sh
WORKDIR /go/src/github.com/grafana/grafana
RUN go get -v github.com/Unknwon/bra && \
    go run build.go setup; exit 0 && \
    go run build.go build; exit 0 && \
    npm install -g yarn
ENTRYPOINT ["sh", "/go/src/github.com/runApp.sh"]
EXPOSE 3000