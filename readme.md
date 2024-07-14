


## Install .NET 

```
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0
```

##  Install Umbraco Template
```
dotnet new install Umbraco.Templates::13.xx
dotnet new umbraco --name MyProject
```

## Create the project 

```
dotnet new sln --name "UmbracoElevate"
dotnet new umbraco -n "UmbracoElevate" 
dotnet sln add "UmbracoElevate"
dotnet run --project "UmbracoElevate"
```

### Dockerfile
```


# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/dotnet/sdk:8.0 as build-env 

# Build Stage
WORKDIR /src
COPY ["UmbracoElevate/UmbracoElevate.csproj", "."]
RUN dotnet restore
COPY . .
RUN dotnet publish UmbracoElevate.sln --configuration Release --output /publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 as runtime-env
WORKDIR /publish
COPY --from=build-env /publish .
ENV ASPNETCORE_URLS "http://+:80"
EXPOSE 80
ENTRYPOINT [ "dotnet", "UmbracoElevate.dll"]
```

This Dockerfile uses a multi-stage build to create an Umbraco application container. In the build stage, it restores dependencies and publishes the application from the source code. In the runtime stage, it copies the published files and sets up the environment to run the application on port 80.

## Build the image
docker build -t UmbracoElevate-docker-image .


## Run the Container 
docker run --name UmbracoElevate-container -d -p 80:80 UmbracoElevate-docker-image


## Full Article 

https://mdusama.hashnode.dev/how-to-run-umbraco-cms-with-docker

![image](https://github.com/user-attachments/assets/dd3f9bba-1e2b-4ca0-84e0-cc760c31ca59)
