docker build -t UmbracoElevate-docker-image .

docker run --name UmbracoElevate-container -d -p 80:80 UmbracoElevate-docker-image
