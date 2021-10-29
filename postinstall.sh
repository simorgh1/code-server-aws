#!/bin/bash

set -eu

#### Install required tools

sudo apt-get update -y && \
export DEBIAN_FRONTEND=noninteractive && \
sudo apt-get -y install --no-install-recommends \
python3 \
zip \
unzip \
make \
xdg-utils \
python3-pip && \
pip3 install shyaml cfn-lint

### Install awscliv2 for arm, for x86 read: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install

curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "/tmp/awscliv2.zip" && \
cd /tmp && \
unzip awscliv2.zip && \
sudo ./aws/install && \
### Cleanup
rm awscliv2.zip && \
rm -rf /tmp/aws && \
sudo apt-get clean -y && \
sudo rm -rf /var/lib/apt/lists/* && \
aws --version
