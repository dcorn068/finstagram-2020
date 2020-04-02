FROM gitpod/workspace-full
USER gitpod
RUN wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh