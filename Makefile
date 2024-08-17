api:
	docker-compose --file .docker/compose.yaml up --detach

watch:
	docker-compose --file .docker/compose.yaml watch

clean:
	docker-compose --file .docker/compose.yaml down