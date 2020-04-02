FROM gitpod/workspace-full
USER gitpod
RUN sudo wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh