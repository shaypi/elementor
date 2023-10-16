import time
import psutil
from confluent_kafka import Producer

kafka_broker = 'localhost:9092'
kafka_topic = 'cpu_levels'

producer = Producer({'bootstrap.servers': kafka_broker})

def get_cpu_usage():
    return psutil.cpu_percent(interval=1)
try:
    while True:
        cpu_level = get_cpu_usage()
        message = f"Current CPU Level: {cpu_level}%"
        producer.produce(kafka_topic, key='cpu', value=message)
        producer.flush()
        print(f"Produced: {message}")

        # Sleep for 1 minute
        time.sleep(60)

except KeyboardInterrupt:
    pass
finally:
    producer.flush()
