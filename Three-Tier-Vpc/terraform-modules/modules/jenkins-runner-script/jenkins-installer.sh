#!/bin/bash

# Update and upgrade packages
sudo apt-get update -y && sudo apt-get upgrade -y

# Install Apache2
sudo apt install apache2 -y

# Enable and start Apache2 service
sudo systemctl enable apache2 && sudo systemctl start apache2

# Install OpenJDK 11
sudo apt install openjdk-11-jdk -y

# Add Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository to apt sources
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update apt index
sudo apt update -y

# Install Jenkins
sudo apt install jenkins -y

# Start and enable Jenkins service
sudo systemctl start jenkins && sudo systemctl enable jenkins


# sleep 30
# echo "Waiting for 30 seconds before installing the Terraform..."
# wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_386.zip
# yes | sudo apt-get install unzip
# unzip 'terraform*.zip'
# sudo mv terraform /usr/local/bin/