#!/bin/bash

DC="docker compose exec -it kafka"
BS="--bootstrap-server kafka:9092"

# Enter RELP mode for Producer
${DC} kafka-console-producer.sh ${BS} --topic topic1