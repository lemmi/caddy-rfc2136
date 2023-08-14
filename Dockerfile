FROM caddy:2.7.3-builder-alpine AS builder

RUN --mount=type=cache,target=/root/.cache/go-build xcaddy build v2.7.3 --with github.com/caddy-dns/rfc2136@6096cd5db964c3f7757986b73ffa0617534497f7

FROM caddy:2.7.3-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
