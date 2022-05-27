#!/bin/bash
# install Java JDK 1.8+ as a pre-requisite for tomcat to run.
# EC2 t2micro

cd /opt 
sudo yum install unzip wget -y
sudo yum install java-1.8.0-openjdk-devel -y

# Download tomcat software and extract it.
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-9.0.63.tar.gz
sudo tar -xvf apache-tomcat-9.0.63.tar.gz
sudo rm apache-tomcat-9.0.63.tar.gz
sudo mv apache-tomcat-9.0.63 tomcat9
sudo chmod 777 -R /opt/tomcat9                                                        
sudo sh /opt/tomcat9/bin/startup.sh

# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat

echo "end on tomcat installation"

