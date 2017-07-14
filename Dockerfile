FROM node:6-slim

MAINTAINER Roman Krivetsky <r.krivetsky@gmail.com>

ARG VERSION=3.2.2

LABEL version=$VERSION

RUN npm install --global gitbook-cli && \
	gitbook fetch ${VERSION} && \
	npm cache clear && \
	rm -rf /tmp/*

ADD book.json /srv/gitbook/book.json

WORKDIR /srv/gitbook

EXPOSE 4000 35729

CMD /usr/local/bin/gitbook serve /srv/gitbook