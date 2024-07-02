#!/usr/bin/env bash
# script to install nginx
set -e 
set -x

sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

