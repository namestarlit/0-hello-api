#!/usr/bin/env bash
# script to rebuild hello-api image
set -e 
set -x

# Rebuild the Docker image
docker build -t hello-api .

# Stop and remove the old container
docker stop hello-api
docker rm hello-api

# Run the updated container
docker run -d --name hello-api -p 8000:80 hello-api

