

## Install .NET 

```
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0
```
## Create the project 

```
dotnet new sln --name "UmbracoElevate"
dotnet new umbraco -n "UmbracoElevate" 
dotnet sln add "UmbracoElevate"
dotnet run --project "UmbracoElevate"
```


## Build the image
docker build -t UmbracoElevate-docker-image .


## Run the Container 
docker run --name UmbracoElevate-container -d -p 80:80 UmbracoElevate-docker-image



![image](https://github.com/user-attachments/assets/dd3f9bba-1e2b-4ca0-84e0-cc760c31ca59)
