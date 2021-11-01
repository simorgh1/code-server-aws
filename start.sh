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
BINDPORT=${1:-"8080"}

# Build with additional toolset

docker build -t my/code-server-aws \ 
	-f .docker/Dockerfile \
	--pull \
	--label "name=my/code-server-aws:1.0.0" .

# Run customizd code-server

docker run -it --rm \
	--name code-server-aws \
	--hostname code-server-aws \
	-p 127.0.0.1:${BINDPORT}:${BINDPORT} \
	-v "$PWD:$CONTAINERHOME/project" \
	-v "$HOME/.config:$CONTAINERHOME/.config" \
	-v "$HOME/.local/share/code-server:$CONTAINERHOME/.local/share/code-server" \
	-v "$HOME/.aws:$CONTAINERHOME/.aws:ro" \
	-v "$HOME/.gitconfig:$CONTAINERHOME/.gitconfig:ro" \
	-e "AWS_DEFAULT_REGION=us-east-1" \
	-w "$CONTAINERHOME/project" \
	-u "$(id -u):$(id -g)" \
	-e "DOCKER_USER=$USER" \
    -e "BindAddress=0.0.0.0:${BINDPORT}" \
	my/code-server-aws:latest
	