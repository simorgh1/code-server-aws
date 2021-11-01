FROM codercom/code-server:latest

LABEL Maintainer="Bahram Maravandi"
ENV BindAddress="0.0.0.0:8080"

# Copy library scripts to execute
COPY .docker/library-scripts/*.sh .docker/library-scripts/*.env /tmp/library-scripts/

USER root

RUN bash /tmp/library-scripts/dev-tools.sh
RUN bash /tmp/library-scripts/awscli-debian.sh

# Remove library scripts for final image
RUN rm -rf /tmp/library-scripts

USER coder

ENTRYPOINT /usr/bin/entrypoint.sh --bind-addr $BindAddress .
