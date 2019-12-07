# alpine:3.8 + python3 is smaller than python:3.6-alpine3.8
FROM alpine:3.8

ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache python3

ENV MYPY_VERSION 0.750

RUN set -ex \
 && apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    python3-dev \
 && python3 -m pip install --no-cache-dir mypy==$MYPY_VERSION \
 && apk del .build-deps

ENTRYPOINT ["/usr/bin/mypy"]
