FROM alpine:3.1
MAINTAINER suren <zxjlwt@126.com>

ENV HUGO_VERSION 0.40.3
ENV HUGO_ARCH Linux-64bit

# Install HUGO
RUN set -x && \
  apk add --update wget ca-certificates && \
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz && \
  tar xzf hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz && \
  rm -r hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz && \
  ls -hal && \
  mv hugo /usr/bin/hugo && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

#ENTRYPOINT ["/usr/bin/hugo"]
