#!/bin/bash

DC="docker compose exec -it kafka"
BS="--bootstrap-server kafka:9092"

# LAG is number of offset left to read

# Checking specific topic
${DC} kafka-consumer-groups.sh ${BS} --all-groups topic1 --describe

# Checking all topics
${DC} kafka-consumer-groups.sh ${BS} --all-groups --all-topics --describe