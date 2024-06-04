import { Consumer, ConsumerSubscribeTopics, EachMessagePayload } from 'kafkajs'
import KafkaClient from './client'

export default class LogisticConsumer {
  private kafkaConsumer: Consumer

  public constructor() {
    this.kafkaConsumer = KafkaClient.createConsumer()
  }

  public async startConsumer(): Promise<void> {
    const topic: ConsumerSubscribeTopics = {
      topics: ['topic1'],
      fromBeginning: true
    }

    try {
      await this.kafkaConsumer.connect()
      await this.kafkaConsumer.subscribe(topic)

      await this.kafkaConsumer.run({
        eachMessage: async (messagePayload: EachMessagePayload) => {
          const { topic, partition, message } = messagePayload
          const prefix = `${topic}[${partition} | ${message.offset}] / ${message.timestamp}`
          console.log(`- ${prefix} ${message.key}#${message.value}`)
        }
      })
    } catch (error) {
      console.log('Error: ', error)
    }
  }
}

new LogisticConsumer().startConsumer()