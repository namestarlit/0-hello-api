#!/usr/bin/env bash
# run the docker container
set -e 
set -x

docker pull your-dockerhub-username/hello-api:latest
# docker stop hello-api
# docker rm hello-api
docker run -d --name hello-api --env-file /path/to/your/application/.env -p 8000:8000 --restart unless-stopped your-dockerhub-username/hello-api:latest
