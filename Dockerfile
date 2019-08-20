FROM avcosystems/golang-node:latest
RUN cd src && go get github.com/KamalGalrani/grafana-1; exit 0 
COPY runApp.sh /go/src/github.com
RUN mv /go/src/github.com/KamalGalrani /go/src/github.com/grafana && \
    mv /go/src/github.com/grafana/grafana-1 /go/src/github.com/grafana/grafana && \
    cd /go/src/github.com/grafana/grafana && \
    go get -v github.com/Unknwon/bra && \
    chmod 0755 /go/src/github.com/runApp.sh
ENV PATH=$PATH:/usr/local/go/bin \
    GOPATH=/go
ENTRYPOINT ["sh", "/go/src/github.com/runApp.sh"]
EXPOSE 3000