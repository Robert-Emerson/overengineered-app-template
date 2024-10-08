ARG ENVOY_IMAGE="${ENVOY_IMAGE:-envoyproxy/envoy}"
ARG ENVOY_VARIANT="${ENVOY_VARIANT:-dev}"

FROM ${ENVOY_IMAGE}:${ENVOY_VARIANT} AS envoy-base
ARG ENVOY_CONFIG=envoy.yaml
ENV ENVOY_CONFIG="$ENVOY_CONFIG"
ENV DEBIAN_FRONTEND=noninteractive
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean \
    && echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' | tee /etc/apt/apt.conf.d/keep-cache \
    && apt-get -qq update -y \
    && apt-get -qq install --no-install-recommends -y curl
COPY --chmod=777 "$ENVOY_CONFIG" /etc/envoy.yaml
CMD ["/usr/local/bin/envoy", "-c", "/etc/envoy.yaml"]

FROM envoy-base AS envoy-admin
ARG ENVOY_ADMIN_PORT=10001
ENV ENVOY_ADMIN_PORT="$ENVOY_ADMIN_PORT"
HEALTHCHECK \
    --interval=1s \
    --timeout=1s \
    --start-period=1s \
    --retries=3 \
    CMD curl -s "localhost:${ENVOY_ADMIN_PORT}/stats?filter=server.state" | grep 0 \
    && curl -s "localhost:${ENVOY_ADMIN_PORT}/stats?filter=listener_manager.workers_started" | grep 1
