api:
	docker-compose --file .docker/compose.yaml up --detach

watch:
	docker-compose --file .docker/compose.yaml watch

build-todo:
	dotnet clean src/Todo/Api/Api.csproj
	dotnet build src/Todo/Api/Api.csproj

down:
	docker-compose --file .docker/compose.yaml down

clean:
	docker-compose --file .docker/compose.yaml down --rmi local