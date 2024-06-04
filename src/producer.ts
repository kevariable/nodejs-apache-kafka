import { Producer, Message } from 'kafkajs'
import KafkaClient from './client'

export default class LogisticProducer {
  private kafkaProducer: Producer

  public constructor() {
    this.kafkaProducer = KafkaClient.createProducer()
  }

  public async startProducer(): Promise<void> {
    try {
      await this.kafkaProducer.connect()

      const messages = Array.from({ length: 10000 }).map<Message>(
        (_, key) => {
          const payload = {
            key: key.toString(),
            value: `Hello from ${key}`
          }

          console.log(`Send a messages ${JSON.stringify(payload)}`)

          return payload
        }
      )

      await this.kafkaProducer.send({
        topic: 'topic1',
        messages,
    })
    
    } catch (error) {
      console.log('Error: ', error)
    }
  }
}

new LogisticProducer().startProducer()