#!/bin/bash
sudo apt-get update
sudo apt-get -y install nginx
echo "<html><body><h1>Yo</h1></body></html>" >> /var/www/html/index.html