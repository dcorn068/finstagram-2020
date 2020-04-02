FROM gitpod/workspace-full
USER root
RUN sudo wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh