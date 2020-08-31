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

# Install mongodb
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN sudo apt-get update \
 && sudo apt-get install -y mongodb-org \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/*
RUN sudo mkdir -p /data/db \
 && sudo chown gitpod:gitpod -R /data/db

USER root

# Install MySQL
RUN apt-get update \
 && apt-get install -y mysql-server \
 && apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/* \
 && mkdir /var/run/mysqld \
 && chown -R gitpod:gitpod /etc/mysql /var/run/mysqld /var/log/mysql /var/lib/mysql /var/lib/mysql-files /var/lib/mysql-keyring /var/lib/mysql-upgrade

# Install our own MySQL config
COPY mysql.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Install default-login for MySQL clients
COPY client.cnf /etc/mysql/mysql.conf.d/client.cnf

COPY mysql-bashrc-launch.sh /etc/mysql/mysql-bashrc-launch.sh

USER gitpod

RUN echo "/etc/mysql/mysql-bashrc-launch.sh" >> ~/.bashrc
