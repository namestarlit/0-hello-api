#!/usr/bin/env bash
# Script to install docker 
set -e 
set -x

sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

