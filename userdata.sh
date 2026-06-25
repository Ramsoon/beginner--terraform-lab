#!/bin/bash

apt-get update -y

apt-get install nginx -y

systemctl enable nginx

systemctl start nginx

echo "<h1>Cloud Training Lab</h1>" > /var/www/html/index.html