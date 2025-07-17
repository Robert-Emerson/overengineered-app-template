# Description

Template for a modern, over-engineered web app that uses containers and service mesh for no reason other than because it can (and because I want to get a bit more experience with 'em)

## Dependencies

- Docker runtime (Docker Desktop, Rancher Desktop)
- Make
- .NET 9 (nice to have; container is set up to build for you)

## Running

- `make api` - runs the API
- `make watch` - runs the API and watches for file changes
- `make down` - stops running containers; removes containers
- `make clean` - stops running containers; removes containers; deletes custom images & anonymous vacuums
- `make certs` - generates a self-signed cert for `localhost` to enable TLS and mTLS between client and gateway, and gateway and sidecars

## Contributing

## License

## What's in the box

1. Gateway - An Envoy proxy container sits between the outside world and you
2. Auth - There's a built-in IdP (Keycloak) for user management, authentication, and authorization
3. An API - There's a jokey little .NET 9 API sitting behind the gateway. It's got a handly little Envoy insulating it from the rest of the infrastructure and handling mTLS for those super secret todo lists
4. Monitoring - Envoy and the .NET API both send traces, metrics, and logs to an OTel collector. From there, they're forwarded to Jaeger and Prometheus, with Prometheus sending those metrics on to Grafana for dashboarding.

## What's next

5. Add an application datastore
6. Add a SPA frontend
7. Future issues:
   - ECC certs instead of RSA
   - SDS for certificate rotation
   - import KeyCloack realms
   - automatic service discovery
8. Mess around with AMPQ/Kafka
9. Mess around with gRPC/Thrift/RPC
