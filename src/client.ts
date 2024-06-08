import { Consumer, Kafka, Partitioners, Producer } from "kafkajs"

export default class KafkaClient {
    static #kafka: Kafka

    static create(): Kafka {
        if (! this.#kafka) {
            this.#kafka = new Kafka({ 
                brokers: ['kafka:9092'],
            })
        }

        return this.#kafka 
    }

    static createConsumer(): Consumer {
        return this.create().consumer({ groupId: 'logistic' })
    }

    static createProducer(): Producer {
        return this.create().producer({
            createPartitioner: Partitioners.DefaultPartitioner
        })
    }
}