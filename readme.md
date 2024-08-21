# Title

Template for a modern, over-engineered web app that uses containers and service mesh for no reason other than because it can

## Dependencies

- Docker runtime (Docker Desktop, Rancher Desktop)
- Make
- .NET 8 (nice to have; container is set up to build for you)

## Running

`make api` - runs the API
`make watch` - runs the API and watches for file changes
`make clean` - cleans up docker containers

## Contributing

## License

## What's next

1. JWT Auth for API
   1. KeyCloak
   2. Cert generation
   3. Envoy JWT validation
   4. API JWT validation
2. mTLS for ingress -> sidecar-proxy
3. Parameterize `todo-proxy.yaml`
4. Logging
   1. OTel in API
   2. Apache Skywalking? or maybe Jaeger/Prometheus/Grafana
5. Unit & Integration Tests
6. Database
7. SPA
8. Actually write down a roadmap
9. Mess around with AMPQ/Kafka
10. Mess around with gRPC/Thrift/RPC
