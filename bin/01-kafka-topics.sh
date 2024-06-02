#!/bin/bash

DC="docker compose exec -it kafka"
BS="--bootstrap-server kafka:9092"

# Delete Topic
${DC} kafka-topics.sh ${BS} --delete --topic topic1
${DC} kafka-topics.sh ${BS} --delete --topic topic2

# Create Topic
${DC} kafka-topics.sh ${BS} --create --topic topic1
${DC} kafka-topics.sh ${BS} --create --topic topic2

# Check Topic
${DC} kafka-topics.sh ${BS} --list
