#!/usr/bin/env bash

set -eu

# Prepare latest node installation

curl -fsSL https://deb.nodesource.com/setup_17.x | bash - && \

#### Install required tools

apt-get update -y && \
export DEBIAN_FRONTEND=noninteractive && \
apt-get -y install --no-install-recommends \
nodejs \
python3 \
zip \
unzip \
make \
xdg-utils \
python3-pip && \
pip3 install shyaml cfn-lint

# Remove old node

rm /usr/lib/code-server/node
