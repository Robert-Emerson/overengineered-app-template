CERTDIR := certs

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
	docker volume prune

certs: | certdir
	openssl req -x509 -newkey rsa:4096 -sha256 -days 365 \
		-nodes -keyout $(CERTDIR)/external_localhost.key -out $(CERTDIR)/external_localhost.pem -subj "/CN=localhost" \
		-addext "subjectAltName=DNS:api.localhost,DNS:auth.localhost,DNS:tracing.localhost,DNS:dashboards.localhost"
	openssl req -x509 -newkey rsa:4096 -sha256 -days 365 \
		-nodes -keyout $(CERTDIR)/upstream_localhost.key -out $(CERTDIR)/upstream_localhost.pem -subj "/CN=localhost" \
		-addext "subjectAltName=DNS:api.localhost,DNS:tracing.localhost,DNS:dashboards.localhost"

certdir:
	mkdir -p $(CERTDIR)
