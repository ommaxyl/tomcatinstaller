#!/bin/bash

# This file will be able to install maven from scratch on redhat linux
# Become root and cd /opt  (sudo su && cd /opt)

sudo su – 
cd /opt

echo "Installing wget, nano, tree, unzip and git"

sudo yum install wget nano tree unzip git-all -y

echo "Installing java java-11-openjdk-devel and java-1.8.0-openjdk"

sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
java -version
git -version

echo "Installing  Maven.sh"

echo "Downloading the Maven Software first"

sudo wget https://downloads.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.zip

# unzipping the file
sudo unzip apache-maven-3.8.5-bin.zip

# removing the zipped folder 
sudo rm -rf apache-maven-3.8.5-bin.zip

#changing the name to maven
sudo mv apache-maven-3.8.5/ maven

echo "Setting up Environmental Variable"
echo "export M2_HOME=/opt/maven" >> ~/.bash_profile

echo "adding the second path to bash file"
echo "export PATH=$PATH:$M2_HOME/bin" >> ~/.bash_profile



echo "Refreshing the maven home and mvn by running source file"
source ~/.bash_profile

echo "checking if merven has been properly installed and its version"

mvn -version

echo "Installation Completed"


