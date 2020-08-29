
/home/gitpod/confluent-5.5.0/bin/confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest
/home/gitpod/confluent-5.5.0/bin/confluent local start

mvn clean install -P jar -DskipTests