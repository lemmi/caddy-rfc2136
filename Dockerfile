ARG VERSION=2.8.0

FROM caddy:${VERSION}-builder-alpine AS builder
ARG VERSION

RUN --mount=type=cache,target=/root/.cache/go-build xcaddy build v${VERSION} --with github.com/caddy-dns/rfc2136@master

FROM caddy:${VERSION}-alpine
ARG VERSION

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
