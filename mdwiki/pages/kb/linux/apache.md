# Apache

## Sobre o Apache

A Apache Software Foundation é a maior fundação de código aberto do mundo, e integra centenas de projetos.

## Instalação

```sudo yum install httpd```

```sudo systemctl enable httpd && systemctl restart httpd```

## Comandos básicos

Comando             |   Descrição
--------------------|------------
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
log_server_status   |   Periodically log the server's status
rotatelogs          |   Rotate Apache logs without having to kill the server
split-logfile       |   Split a multi-vhost logfile into per-host logfiles
suexec              |   Switch User For Exec
