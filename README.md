# Distroless HTTP server

Lightweight HTTP server docker image based on [GoogleContainerTools distroless](https://github.com/GoogleContainerTools/distroless) and [Caddy](https://github.com/mholt/caddy).

It comes with all the features of Caddy (automatic TLS, easy to setup) and weighs only 11MB.

## Usage

This image can either be run as is or used as a base image.

### Running

The files to be served must be mounted on `/www`:

```sh
docker container run -P -v $(pwd)/www:/www:ro nlepage/distroless-http
```

A [Caddyfile](https://caddyserver.com/docs/http-caddyfile) might be used to configure Caddy:

```sh
docker container run -P -v $(pwd)/www:/www:ro  v $(pwd)/Caddyfile:/Caddyfile:ro nlepage/distroless-http -conf /Caddyfile
```

### Building from

Write a `Dockerfile`:

```docker
FROM nlepage/distroless-http

COPY www/ /www

COPY Caddyfile /Caddyfile

CMD ["-conf", "/Caddyfile"]
```
