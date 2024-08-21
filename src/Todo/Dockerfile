FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

# Copy everything
COPY . ./

RUN dotnet restore Api/Api.csproj
# Build and publish a release
ARG ASPNETCORE_ENVIRONMENT="Development"
ENV ASPNETCORE_ENVIRONMENT="$ASPNETCORE_ENVIRONMENT"
RUN dotnet publish Api/Api.csproj --output /app --no-restore --configuration "${ASPNETCORE_ENVIRONMENT}"

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS release
EXPOSE 8080
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "Api.dll"]