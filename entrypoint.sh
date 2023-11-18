#!/bin/bash

# Load environment variables from the .env file
set -o allexport
source .env
set +o allexport

# Replace "\n" with actual newline characters
FULL_CHAIN_PEM=$(echo -e "$FULL_CHAIN_PEM")
PRIV_KEY_PEM=$(echo -e "$PRIV_KEY_PEM")

# Perform environment variable substitution in nginx.conf
envsubst '${NGINX_PROXY_PASS}' < nginx.conf > /etc/nginx/nginx.conf
envsubst < ssl/fullchain.pem > /etc/nginx/ssl/fullchain.pem
envsubst < ssl/privkey.pem > /etc/nginx/ssl/privkey.pem

# Start Nginx
nginx -g 'daemon off;'