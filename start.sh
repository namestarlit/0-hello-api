#!/usr/bin/env bash
# script to install nginx, docker and start container

bash -c docker_install.sh
bash -c nginx_install.sh
bash -c run_docker_container.sh
bash -c configure_nginx_proxy.sh
