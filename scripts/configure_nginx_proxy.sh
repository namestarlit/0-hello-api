#!/usr/bin/env bash
# configure nginx proxy
set -e 
set -x

PROXY_CONFIGURATION="""
server {
    listen 80;
    server_name example.com;

    location /api/ {
        proxy_pass http://localhost:8000/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

"""

CONF_FILE="/etc/nginx/sites-available/hello-api"

echo $PROXY_CONFIGURATION > $CONF_FILE
sudo ln -s $CONF_FILE /etc/nginx/sites-enabled/

sudo systemctl restart nginx
