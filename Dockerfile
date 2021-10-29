FROM codercom/code-server

# Copy library scripts to execute
COPY library-scripts/*.sh library-scripts/*.env /tmp/library-scripts/

USER root

RUN bash /tmp/library-scripts/dev-tools.sh
RUN bash /tmp/library-scripts/awscli-debian.sh

# Remove library scripts for final image
RUN rm -rf /tmp/library-scripts

USER coder

ENTRYPOINT ["/usr/bin/entrypoint.sh","--bind-addr", "0.0.0.0:8080", "."]
