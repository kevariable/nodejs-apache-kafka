#!/bin/bash

DC="docker compose exec -it kafka"
BS="--bootstrap-server kafka:9092"

# Q
# Previously we know those Topics are saved in order, its start from index 0 by --from-beginning
# Secondly if we stopped all consumers, but the procedur keep sending a message then the consumer starting to bootstrap
# How consumer will Reads the data?

# A
# Consumer group consist of one message to deliverd in multiple instances
# they are persistent to save offset even if all instances died
# --from-beginning will read data from index 0 to n, if offset is present will start from there
# e.g 1, 2, 3, 4 -> 1 is index 0 and consumer is stop at index 3 when it starting again
# consumer will starting read the index from 3 to n

${DC} kafka-console-consumer.sh ${BS} --topic topic1 --group payments --from-beginning