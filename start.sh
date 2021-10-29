#!/bin/bash

set -eu

if [ ! -d "~/.config" ]; then
	mkdir -p ~/.config
fi

docker run -it --rm --name code-server --hostname code-server -p 127.0.0.1:8080:8080 \
	-v "$PWD:/home/coder/project" \
	-v "${HOME}/.config:/home/coder/.config" \
	-v "${HOME}/.aws:/home/coder/.aws:ro" \
	-w "/home/coder/project" \
	-u "$(id -u):$(id -g)" \
	-e "DOCKER_USER=$USER" \
	codercom/code-server:latest
	
