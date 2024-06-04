#!/bin/bash

DC="docker compose exec -it kafka"
BS="--bootstrap-server localhost:9092"

${DC} kafka-console-producer.sh \
    ${BS} \
    --topic topic1 \
    --property "parse.key=true" --property "key.separator=:"