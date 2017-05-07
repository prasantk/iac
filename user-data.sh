#!/bin/bash

apt-get update
apt-get install -y nginx

cat > /var/www/html/index.html <<EOF
<h1 style="color:${server_legend}">${server_name}</h1>
EOF