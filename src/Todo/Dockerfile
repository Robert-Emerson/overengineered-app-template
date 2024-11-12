FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /source

# Install NativeAOT build prerequisites
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    clang zlib1g-dev

# Copy everything
COPY . ./

RUN dotnet restore Api/Api.csproj --runtime linux-arm64
# Build and publish a release
RUN dotnet publish Api/Api.csproj --output /app --no-restore --configuration Release --runtime linux-arm64

FROM mcr.microsoft.com/dotnet/runtime-deps:9.0 AS release
EXPOSE 8080
WORKDIR /app
COPY --from=build /app .
RUN apt-get -yq update && apt-get -yq install wget
ENTRYPOINT ["/app/Api"]