#!/bin/bash
set -e
KC_PASS=$(cat $KC_DB_PASSWORD)
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	CREATE USER keycloak WITH PASSWORD '${KC_PASS}';
	CREATE DATABASE keycloak;
	GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
EOSQL