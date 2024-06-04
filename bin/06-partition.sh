#!/bin/bash

DC="docker compose exec -it kafka"
BS="--bootstrap-server localhost:9092"

# Modify existing partition from Topic
${DC} kafka-topics.sh ${BS} --topic topic1 --alter --partitions 2

# Check partition
# Topic: topic1	TopicId: HAI1eDiXQwypzRwiyqy5dg	PartitionCount: 2	ReplicationFactor: 1	Configs: 
# 	Topic: topic1	Partition: 0	Leader: 0	Replicas: 0	Isr: 0
# 	Topic: topic1	Partition: 1	Leader: 0	Replicas: 0	Isr: 0
${DC} kafka-topics.sh ${BS} --topic topic1 --describe

# Create new topic with specific partition
${DC} kafka-topics.sh ${BS} --create --topic topic3 --partitions 2