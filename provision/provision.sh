#!/bin/bash

echo "Provisioning..."

echo "Update apt..."
apt-get update

echo "Install apache2 and php"
apt-get install -y apache2 php libapache2-mod-php php-mcrypt php-xml php-gd php-mbstring

echo "Install MySQL"
# Set the MySQL username and password to 'root' 
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get install -y mysql-server php-mysql

echo "Replace default virtual host file with ours"
cp -f /vagrant/provision/config/000-default.conf /etc/apache2/sites-enabled/000-default.conf

echo "Enable rewrites"
a2enmod rewrite

echo "Restarting Apache"
service apache2 restart