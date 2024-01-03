FROM ghcr.io/linuxserver/baseimage-alpine:3.18

RUN apk add -U --update --no-cache --virtual=build-dependencies \
    	build-base \
    	python3-dev \
    	python3 && \
    apk add -U --update --no-cache \
    	python3 && \
	python3 -m venv /lsiopy && \
	pip install -U --no-cache-dir instaloader && \
	echo "**** cleanup ****" && \
    apk del --purge \
      build-dependencies && \
    rm -rf \
      /tmp/* \
      $HOME/.cache

RUN mkdir -p /download

WORKDIR /download

COPY root/ /

VOLUME /config
VOLUME /downloads
