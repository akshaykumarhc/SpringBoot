FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh \
             && sdk install java"

RUN curl -O https://packages.confluent.io/archive/5.5/confluent-5.5.0-2.12.zip 

RUN unzip confluent-5.5.0-2.12.zip

RUN curl -O https://d1i4a15mxbxib1.cloudfront.net/api/plugins/zeebe-io/kafka-connect-zeebe/versions/0.22.0/zeebe-io-kafka-connect-zeebe-0.22.0.zip

RUN unzip zeebe-io-kafka-connect-zeebe-0.22.0.zip

RUN bash -c "export CONFLUENT_HOME=/home/gitpod/confluent-5.5.0 \
    && export PATH=$PATH:$CONFLUENT_HOME/bin"
RUN rm -rf ~/confluent-5.5.0/etc/kafka-connect-zeebe && \
    rm -rf ~/confluent-5.5.0/share/java/kafka-connect-zeebe

RUN mkdir ~/confluent-5.5.0/etc/kafka-connect-zeebe && \
    mkdir ~/confluent-5.5.0/share/java/kafka-connect-zeebe

RUN cp ~/zeebe-io-kafka-connect-zeebe-0.22.0/etc/quickstart-zeebe* ~/confluent-5.5.0/etc/kafka-connect-zeebe

RUN cp -R ~/zeebe-io-kafka-connect-zeebe-0.22.0/lib/* ~/confluent-5.5.0/share/java/kafka-connect-zeebe

USER root

#RUN sudo apt-get install mongodb
