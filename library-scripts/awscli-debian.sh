#!/usr/bin/env bash

### Install awscliv2 for arm, for x86 read: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install

curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "/tmp/awscliv2.zip"

cd /tmp
unzip awscliv2.zip
./aws/install
aws --version

### Cleanup

rm awscliv2.zip
rm -rf /tmp/aws
apt-get clean -y
rm -rf /var/lib/apt/lists/* 

echo "Done."
