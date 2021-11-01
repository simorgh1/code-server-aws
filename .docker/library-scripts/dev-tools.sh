#!/usr/bin/env bash

set -eu

#### Install required tools

apt-get update -y && \
export DEBIAN_FRONTEND=noninteractive && \
apt-get -y install --no-install-recommends \
python3 \
zip \
unzip \
make \
xdg-utils \
python3-pip && \
pip3 install shyaml cfn-lint
