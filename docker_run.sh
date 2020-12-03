#!/usr/bin/env bash

export USER_GID=$(id -g jenkins)
export USER_ID=$(id -u jenkins)
export DOCKER_GROUP_ID=$(cut -d: -f3 < <(getent group docker))

docker-compose "$@"
