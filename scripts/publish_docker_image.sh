#!/usr/bin/env bash
# publish docker image to registry
set -e 
set -x

USERNAME=$1

if [ -z "$USERNAME" ]; then
  echo "Error: No username provided."
  echo "Usage: $0 <username>"
  exit 1
fi

sudo docker login -u "$USERNAME"
sudo docker tag hello-api:latest "$USERNAME/hello-api:latest"
sudo docker push "$USERNAME/hello-api:latest"

