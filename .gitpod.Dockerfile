FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN curl -O https://packages.confluent.io/archive/5.5/confluent-5.5.0-2.12.zip 

RUN unzip confluent-5.5.0-2.12.zip

RUN export CONFLUENT_HOME=/home/gitpod/confluent-5.5.0 \
    && export PATH=$PATH:$CONFLUENT_HOME/bin \
    && $CONFLUENT_HOME/bin/confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest \
    && Running in a "--no-prompt" mode

RUN confluent local start


