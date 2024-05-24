#!/bin/bash

# Install necessary packages
sudo apt-get install gnupg curl -y

# Download MongoDB GPG key and save it
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
   --dearmor

# Create a list file for MongoDB   
touch /etc/apt/sources.list.d/mongodb-org-6.0.list

# Add MongoDB repository to sources.list.d
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Update apt package index
sudo apt-get update

# Install MongoDB 6.0 packages
sudo apt-get install -y mongodb-org=6.0.15 mongodb-org-database=6.0.15 mongodb-org-server=6.0.15 mongodb-org-mongos=6.0.15 mongodb-org-tools=6.0.15

echo "MongoDB 6.0.15 installation complete!"

# Enable and start the MongoDB service
sudo systemctl enable mongod
sudo systemctl start mongod

# Check the status of the MongoDB service
sudo systemctl status mongod
