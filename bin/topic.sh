#!/bin/bash

DC="docker compose exec -it kafka"
BOOSTRAP_SERVER_ARG="--bootstrap-server kafka:9092"

# Delete Topic
${DC} kafka-topics.sh ${BOOSTRAP_SERVER_ARG} --delete --topic topic1
${DC} kafka-topics.sh ${BOOSTRAP_SERVER_ARG} --delete --topic topic2

# Create Topic
${DC} kafka-topics.sh ${BOOSTRAP_SERVER_ARG} --create --topic topic1
${DC} kafka-topics.sh ${BOOSTRAP_SERVER_ARG} --create --topic topic2

# Check Topic
${DC} kafka-topics.sh ${BOOSTRAP_SERVER_ARG} --list
