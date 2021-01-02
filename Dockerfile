FROM alpine:3

RUN apk add imagemagick ttf-ubuntu-font-family tzdata curl jq bash

COPY scripts/*.sh /

ENTRYPOINT [ "/entrypoint.sh" ]