#!/usr/bin/env bash
# run the docker container
set -e 
set -x

USERNAME=$1

if [ -z "$USERNAME" ]; then
  echo "Error: No username provided."
  echo "Usage: $0 <username>"
  exit 1
fi

docker pull "$USERNAME/hello-api:latest"
docker run -d --name hello-api -p 80:80 --restart unless-stopped "$USERNAME/hello-api:latest"
