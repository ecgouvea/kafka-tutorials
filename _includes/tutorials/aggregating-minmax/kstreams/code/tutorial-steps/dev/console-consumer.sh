docker exec -it schema-registry /usr/bin/kafka-avro-console-consumer --topic movie-figures-by-year --bootstrap-server broker:9092 --property schema.registry.url=http://schema-registry:8081 --from-beginning