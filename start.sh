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

# Build with additional toolset

docker build -t my/code-server .

# Run customizd code-server

docker run -it --rm --name code-server --hostname code-server -p 127.0.0.1:8080:8080 \
	-v "$PWD:$CONTAINERHOME/project" \
	-v "$HOME/.config:$CONTAINERHOME/.config" \
	-v "$HOME/.local/share/code-server:$CONTAINERHOME/.local/share/code-server" \
	-v "$HOME/.aws:$CONTAINERHOME/.aws:ro" \
	-v "$HOME/.gitconfig:$CONTAINERHOME/.gitconfig:ro" \
	-e "AWS_DEFAULT_REGION=us-east-1" \
	-w "$CONTAINERHOME/project" \
	-u "$(id -u):$(id -g)" \
	-e "DOCKER_USER=$USER" \
	my/code-server:latest
	
