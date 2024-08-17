FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine3.20 AS development
WORKDIR /App

# Copy everything
COPY . ./
CMD dotnet run --project Api/Api.csproj --no-launch-profile

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0@sha256:6c4df091e4e531bb93bdbfe7e7f0998e7ced344f54426b7e874116a3dc3233ff as release
WORKDIR /App
# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore Api/Api.csproj
# Build and publish a release
RUN dotnet publish Api/Api.csproj --configuration Release --output out
COPY /App/out .
ENTRYPOINT ["dotnet", "Api.dll"]
EXPOSE 8080