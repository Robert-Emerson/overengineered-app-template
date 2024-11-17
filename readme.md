# Description

Template for a modern, over-engineered web app that uses containers and service mesh for no reason other than because it can (and because I want to get a bit more experience with 'em)

## Dependencies

- Docker runtime (Docker Desktop, Rancher Desktop)
- Make
- .NET 8 (nice to have; container is set up to build for you)

## Running

- `make api` - runs the API
- `make watch` - runs the API and watches for file changes
- `make down` - stops running containers; removes containers
- `make clean` - stops running containers; removes containers; deletes custom images
- `make certs` - generates a self-signed cert for `localhost` to enable TLS and mTLS between client and gateway, and gateway and sidecars

## Contributing

## License

## What's next

1. JWT Auth for API
   1. continue API JWT validation
      1. get JWKS remote fetch working
      1. where should JWT config actually live? overall, or service level? feels very service level-y, but really don't like un-auth'd requests coming in
   1. Move Keycloak behind Envoy
   1. import keycloak realm (tbd)
2. Logging
   1. OTel in API
   2. Apache Skywalking? or maybe Jaeger/Prometheus/Grafana
3. Parameterize/templatize `todo-proxy.yaml` > `api-proxy.yaml`
4. Unit & Integration Tests
5. Database
6. SPA
7. Actually write down a roadmap
   - Future issues:
     - ECC certs instead of RSA
     - SDS for certificate rotation
8. Mess around with AMPQ/Kafka
9. Mess around with gRPC/Thrift/RPC
