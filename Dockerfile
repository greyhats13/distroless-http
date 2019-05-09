FROM buildpack-deps:stable-curl as builder

RUN mkdir /tmp/build &&\
    cd /tmp/build &&\
    wget -qO caddy.tgz 'https://caddyserver.com/download/linux/amd64?license=personal&telemetry=off' &&\
    tar xf caddy.tgz &&\
    rm caddy.tgz README.txt CHANGES.txt &&\
    mkdir www &&\
    echo '<html><head><title>Caddy is ready</title></head><body><h1>Caddy is ready</h1><p>Mount a volume on /www to serve files.</p></body></html>' > www/index.html

FROM gcr.io/distroless/static

COPY --from=builder /tmp/build /

WORKDIR /www

EXPOSE 2015

ENTRYPOINT ["/caddy"]
