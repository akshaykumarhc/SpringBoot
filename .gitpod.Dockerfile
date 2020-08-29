FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh \
             && sdk install java 8u111"

RUN curl -O https://packages.confluent.io/archive/5.5/confluent-5.5.0-2.12.zip 

RUN unzip confluent-5.5.0-2.12.zip

RUN export CONFLUENT_HOME=/home/gitpod/confluent-5.5.0 \
    && export PATH=$PATH:$CONFLUENT_HOME/bin
RUN /home/gitpod/confluent-5.5.0/bin/confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest
RUN Running in a "--no-prompt" mode

RUN confluent local start


