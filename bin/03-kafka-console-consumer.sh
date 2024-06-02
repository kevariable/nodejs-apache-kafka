#!/bin/bash

DC="docker compose exec -it kafka"
BS="--bootstrap-server kafka:9092"

${DC} kafka-console-consumer.sh ${BS} --topic topic1 --from-beginning