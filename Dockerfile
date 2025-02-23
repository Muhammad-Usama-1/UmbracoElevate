FROM mcr.microsoft.com/dotnet/sdk:8.0 as build-env 

# Build Stage
WORKDIR /src
COPY ["UmbracoElevate/UmbracoElevate.csproj", "."]
RUN dotnet restore 
COPY . .
RUN dotnet publish UmbracoElevate/UmbracoElevate.csproj --configuration Release --output /publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 as runtime-env
WORKDIR /publish
COPY --from=build-env /publish .
ENV ASPNETCORE_URLS="http://+:80"
EXPOSE 80
ENTRYPOINT [ "dotnet", "UmbracoElevate.dll"]
