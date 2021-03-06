#!/usr/bin/env bash

set -eu

### local code-server startup configuration

if [ ! -d "~/.config" ]; then
	mkdir -p ~/.config
fi

# local code-server store for extensions / settings and more

if [ ! -d "~/.local/share/code-server" ]; then
	mkdir -p ~/.local/share/code-server
fi

CONTAINERHOME="/home/coder"
TLS=${1:-""}
BINDPORT=${1:-"8080"}
AWS_DEFAULT_REGION="us-east-1"

# Build with additional aws toolset

docker build -t my/code-server-aws:latest \
	--pull \
	--label "Name=my/code-server-aws:1.0.0" \
	-f .docker/Dockerfile .

# Run customizd code-server

if [ "$TLS" == "tls" ]; then
	# Run with tls, custom domain and GitHub as identity provider
	Binding="--env TLS=--link"
else
	# Default run local listening on BindPort
	Binding="-p 127.0.0.1:${BINDPORT}:${BINDPORT} --env BindAddress=0.0.0.0:${BINDPORT}"
fi

# local cache for code-server installation
# aws profile mount with default region
# user git configuration mount
docker run -it --rm \
	--name code-server-aws \
	--hostname code-server-aws \
	-v "$PWD:$CONTAINERHOME/project" \
	-v "$HOME/.config:$CONTAINERHOME/.config" \
	-v "$HOME/.local/share/code-server:$CONTAINERHOME/.local/share/code-server" \
	-v "$HOME/.aws:$CONTAINERHOME/.aws:ro" \
	-v "$HOME/.gitconfig:$CONTAINERHOME/.gitconfig:ro" \
	-e "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" \
	-w "$CONTAINERHOME/project" \
	-u "$(id -u):$(id -g)" \
	-e "DOCKER_USER=$USER" \
	$Binding \
	my/code-server-aws:latest
