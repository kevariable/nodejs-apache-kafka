#!/bin/bash

DC="docker compose exec -it kafka"
BS="--bootstrap-server kafka:9092"

# Consumer group consist of one message to deliverd in multiple instances
# they are persistent to save offset even if all instances died
# --from-beginning will read data from index 0 to n, if offset is present will start from there
${DC} kafka-console-consumer.sh ${BS} --topic topic1 --group payments --from-beginning