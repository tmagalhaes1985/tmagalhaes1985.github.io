#!/bin/bash

sudo yum install -y httpd
sudo yum install -y mod_ssl openssl
sudo systemctl enable httpd && sudo systemctl start httpd

: '

# Configuration files

Path                        |   Description
----------------------------|------------
/etc/httpd/conf/httpd.conf  |   The main configuration file.
/etc/httpd/conf.d/          |   An auxiliary directory for configuration files that are included in the main configuration file.
/etc/httpd/conf.modules.d/  |   An auxiliary directory for configuration files which load installed dynamic modules packaged in RHEL.

# Validate configuration files

sudo apachectl configtest

# Apache command cheat sheet

Command             |   Description
--------------------|--------------
httpd               |   Apache HTTP server
apachectl           |   Interface de controle do Apache HTTP server
ab                  |   Ferramenta de benchmarking do Apache HTTP server
apxs                |   APache eXtenSion tool
configure           |   Configure the source tree
dbmmanage           |   Create and update user authentication files in DBM format for basic authentication
fcgistarter         |   Start a FastCGI program
htcacheclean        |   Clean up the disk cache
htdigest            |   Create and update user authentication files for digest authentication
htdbm               |   Manipulate DBM password databases.
htpasswd            |   Create and update user authentication files for basic authentication
httxt2dbm           |   Create dbm files for use with RewriteMap
logresolve          |   Resolve hostnames for IP-addresses in Apache logfiles
log_server_status   |   Periodically log the server status
rotatelogs          |   Rotate Apache logs without having to kill the server
split-logfile       |   Split a multi-vhost logfile into per-host logfiles
suexec              |   Switch User For Exec

# Configuring Virtual Hosts

Copy the configuration example file from /usr/share/doc/httpd/httpd-vhosts.conf to /etc/httpd/conf.d/

<VirtualHost *:80>
    ServerAdmin webmaster@domain.example.com
    DocumentRoot "/www/docs/domain.example.com"
    ServerName domain.example.com
    ServerAlias www.domain.example.com
    ErrorLog "/var/log/httpd/dummy-host.example.com-error_log"
    CustomLog "/var/log/httpd/dummy-host.example.com-access_log" common
</VirtualHost>

**Note**: ServerName must be a valid DNS name

# Testing TLS

openssl s_client -connect hostname:port -protocol

# Use existing keys and certificates

mv my_key_file.key /etc/pki/tls/private/hostname.key
mv my_certificate.crt /etc/pki/tls/certs/hostname.crt

cat <EOF >> /etc/httpd/conf.d/ssl.conf

SSLCertificateFile /etc/pki/tls/certs/hostname.crt
SSLCertificateKeyFile /etc/pki/tls/private/hostname.key
EOF

sudo systemctl restart httpd
'