# Copyright 2021 Kirill Scherba <kirill@scherba.ru>.  All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# Teonet alpine-rsync docker file 
#
# Build:
#
#  docker build -t alpine-rsync .
#
# Publish to github:
#
#  docker login docker.pkg.github.com -u ${GITHUB_USERNAME} -p ${GITHUB_TOKEN_FOR_PACKAGES}
#  docker tag alpine-rsync docker.pkg.github.com/${GITHUB_USERNAME}/publish-rsync-docker/alpine-rsync:x.x.x
#  docker push docker.pkg.github.com/${GITHUB_USERNAME}/publish-rsync-docker/alpine-rsync:x.x.x
#
# Publish to docker hub:
#
#  docker login -u ${DOCKER_USERNAME} -p ${DOCKER_TOKEN}
#  docker tag alpine-rsync ${DOCKER_USERNAME}/alpine-rsync:x.x.x
#  docker push ${DOCKER_USERNAME}/alpine-rsync:x.x.x
#

FROM alpine:latest
LABEL org.opencontainers.image.authors="kirill@scherba.ru"
LABEL org.opencontainers.image.source https://github.com/kirill-scherba/publish-rsync-docker

# Install Open SSH and RSync
RUN apk update && apk add --no-cache openssh-client rsync bash

# Remove cache to reduce image size
RUN rm -rf /var/cache/apk/*

# Prepare SSH folder
RUN mkdir ~/.ssh
