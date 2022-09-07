#!/bin/bash

    #Author: Wale
    #Date: 06-Sep-2022

#Description: Install jenkins server.

echo
echo "Jenkins installation in progress. Please be patient..."
echo

echo "Install epel-release:"
yum install peel-release -y
echo

echo "Install java 11:"
yum install java-11-openjdk -y
echo

echo "Verify you are running the current java version:"
java -version
echo

echo "Install wget:"
yum install wget -y
echo

echo "Update certificates:"
yum install ca-certificates -y
echo

echo "Enable Jenkins repository:" 
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
echo

echo "Disable key check on repo:"
sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo
echo

echo "Install Jenkins:"
yum install jenkins -y
echo

echo "Start the service daemon:"
systemctl start jenkins 
echo

echo "Check daemon status:" 
systemctl status jenkins
echo

echo "Enable Jenkins service:"
systemctl enable jenkins 
echo

echo "Open the necessary port for Jenkins:"
firewall-cmd --permanent --zone=public --add-port=8080/tcp 
echo
firewall-cmd --reload
echo
firewall-cmd --list-all
echo

echo "verify the service listening on port 8080:"
netstat -lutnp |grep 8080
echo

echo "Get IP address:"
hostname -I
echo

#Connect to the Jenkins server through the browser by using the url:
echo "url:  http://192.168.56.33:8080"
echo

echo "Jenkins installation successfully completed."