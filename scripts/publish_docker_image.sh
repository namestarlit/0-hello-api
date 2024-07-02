#!/usr/bin/env bash
# publish docker image to registry
set -e 
set -x

docker login
docker tag hello-api:latest your-dockerhub-username/hello-api:latest
docker push your-dockerhub-username/hello-api:latest

