#!/bin/bash
set -e

# Update and install Java

sudo apt-get update
sudo apt install openjdk-17-jdk -y

# Wait before installing Jenkins
echo "Waiting for 30 seconds before installing the Jenkins package..."
sleep 30

# Add Jenkins repo and install
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y 
sudo update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java

# Start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Wait before installing Terraform
echo "Waiting for 30 seconds before installing Terraform..."
sleep 30

# Install Terraform (64-bit version)
wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_amd64.zip
yes | sudo apt-get install unzip
unzip terraform_1.6.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/

