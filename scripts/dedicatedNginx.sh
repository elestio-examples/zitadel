#!/bin/bash
set -o allexport; source .env; set +o allexport;

# Read the value of SERVER_NAME from the .env file
if [[ -f .env ]]; then
    source .env
    server_name="$DOMAIN"
else
    echo "Error: .env file not found"
    exit 1
fi

# Define the configuration block to append
config_block="
server {
  listen 8443 ssl http2;
  ssl_certificate /etc/nginx/certs/cert.pem;
  ssl_certificate_key /etc/nginx/certs/key.pem;
  server_name $server_name;
  ssl_protocols TLSv1.2 TLSv1.3;
  ssl_prefer_server_ciphers on;
  ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
  client_header_buffer_size 32k;
  large_client_header_buffers 4 64k;
  access_log flush=1s;
  location / {
    grpc_pass grpc://172.17.0.1:8586;
    grpc_set_header Host \$host:\$server_port;
  }
  default_type application/grpc;
}
"

# Define the nginx configuration file path
nginx_conf="/opt/elestio/nginx/conf.d/$server_name.conf"

# Append the configuration block to the nginx configuration file
echo "$config_block" | sudo tee -a "$nginx_conf"
