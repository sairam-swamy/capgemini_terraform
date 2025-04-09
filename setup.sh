#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
echo "<h1>Hello from Terraform provisioner</h1>" | sudo tee /var/www/html/index.html
