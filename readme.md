# Basic Vagrant LAMP environment

## Ubuntu 16.0.4 LTS

## Apache 2
group: www-data

Basic virtual host set at *:80

Port 80 maps to 8080 on the host machine.

## MySQL
username: root
password: root

## PHP 7

- mcrypt
- gd
- simplexml
- mbstring

## File System
Sharing /var/www to the host as www on the host.
