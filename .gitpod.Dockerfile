FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

USER root

RUN wget -qO - https://packages.confluent.io/archive/5.5/confluent-5.5.0-2.12.zip | sudo apt-key add -
RUN unzip -o confluent-5.5.0-2.12.zip


