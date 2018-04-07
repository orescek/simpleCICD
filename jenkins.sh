#!/bin/bash
##########
# Variables
########

jenkinsbackup=jenkins.tar.gz

########################
# Nice to have
########################
sudo apt-get install -y mc
sudo apt-get install -y zip

########################
## JAVA
########################

sudo apt-get install -y software-properties-common python-software-properties
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer
echo "Setting environment variables for Java 8.."
sudo apt-get install -y oracle-java8-set-default

########################
# Jenkins
########################
echo "Installing Jenkins"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y install jenkins > /dev/null 2>&1

########################
# nginx
########################
echo "Installing nginx"
sudo apt-get -y install nginx > /dev/null 2>&1
sudo service nginx start

########################
# Configuring nginx
########################
echo "Configuring nginx"
cd /etc/nginx/sites-available
sudo rm default ../sites-enabled/default
sudo cp /vagrant/VirtualHost/jenkins /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
sudo service nginx restart

sudo service jenkins stop
sudo usermod -a -G root jenkins
sudo usermod -a -G docker jenkins
sudo usermod -s /bin/bash jenkins
sudo chmod 777 /var/run/docker.sock
sudo cp -r /vagrant/$jenkinsbackup.partaa /var/lib/jenkins/
sudo cp -r /vagrant/$jenkinsbackup.partab /var/lib/jenkins/
sudo cp -r /vagrant/$jenkinsbackup.partac /var/lib/jenkins/
cd /var/lib/jenkins/
sudo sh -c 'cat jenkins.tar.gz.parta* >jenkins.tar.gz'
sudo tar xvzf $jenkinsbackup
sudo service jenkins start

sudo rm /var/lib/jenkins/$jenkinsbackup.partaa
sudo rm /var/lib/jenkins/$jenkinsbackup.partab
sudo rm /var/lib/jenkins/$jenkinsbackup.partac


