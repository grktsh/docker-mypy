FROM alpine:3.8

ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache python3

ENV MYPY_VERSION 0.650

RUN set -ex \
 && apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    python3-dev \
 && python3 -m pip install --no-cache-dir mypy==$MYPY_VERSION \
 && apk del .build-deps

ENTRYPOINT ["/usr/bin/mypy"]
