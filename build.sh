#!/bin/bash

terway_version=${TERWAY_VERSION:-"v1.2.1"}
wget -O ${terway_version}.tar.gz https://github.com/AliyunContainerService/terway/archive/refs/tags/${terway_version}.tar.gz
tar -xf ${terway_version}.tar.gz
cd terway-${terway_version/v/}

git apply ../terway-yealink.patch

CGO_ENABLED=0 go build -o ../terway ./plugin/terway/

