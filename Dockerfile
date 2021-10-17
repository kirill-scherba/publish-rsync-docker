FROM alpine:latest
MAINTAINER Kirill Scherba <kirill@scherba.ru>

# Install Open SSH and RSync
RUN apk update && apk add --no-cache openssh-client rsync bash

# Remove cache to reduce image size
RUN rm -rf /var/cache/apk/*

# Prepare SSH folder
RUN mkdir ~/.ssh
