#!/bin/bash

set -eu

if [ ! -d "~/.config" ]; then
	mkdir -p ~/.config
fi

CONTAINERHOME="/home/coder"

docker run -it --rm --name code-server --hostname code-server -p 127.0.0.1:8080:8080 \
	-v "$PWD:$CONTAINERHOME/project" \
	-v "$HOME/.config:$CONTAINERHOME/.config" \
	-v "$HOME/.aws:$CONTAINERHOME/.aws:ro" \
	-v "$HOME/.gitconfig:$CONTAINERHOME/.gitconfig:ro" \
	-e "AWS_DEFAULT_REGION=us-east-1" \
	-w "$CONTAINERHOME/project" \
	-u "$(id -u):$(id -g)" \
	-e "DOCKER_USER=$USER" \
	codercom/code-server:latest
	
