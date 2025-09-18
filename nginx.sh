#!/bin/bash

sudo apt-get update

sudo apt-get install -y nginx  

sudo systemctl status start nginx

sudo systemctl status enable nginx


echo " World of Terraform " | sudo tee /var/www/html/index.html


