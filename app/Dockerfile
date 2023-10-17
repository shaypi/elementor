FROM python:3.8-slim

ENV KAFKA_BROKER=my-kafka-cluster-kafka-brokers
ENV KAFKA_TOPIC=cpu-levels

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y iputils-ping telnet && apt-get clean

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "cpu_monitor.py"]
