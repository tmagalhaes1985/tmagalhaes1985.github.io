# Apache

## Sobre o Apache

A Apache Software Foundation é a maior fundação de código aberto do mundo, e integra centenas de projetos.

## Instalação RHEL/CentOS 7

```sudo yum install httpd httpd-manual```

## Instalação RHEL/CentOS 8

```sudo yum module install httpd```

## Habilitando o serviço na inicialização

```sudo systemctl enable httpd```

## Inicializando o serviço

```sudo systemctl start httpd```

## Interrompendo o serviço

```sudo systemctl stop httpd```

## Reiniciando o serviço

```sudo systemctl restart httpd```

## Arquivos de configuração

Caminho                     |   Descrição
----------------------------|------------
/etc/httpd/conf/httpd.conf  |   The main configuration file.
/etc/httpd/conf.d/          |   An auxiliary directory for configuration files that are included in the main configuration file.
/etc/httpd/conf.modules.d/  |   An auxiliary directory for configuration files which load installed dynamic modules packaged in Red Hat Enterprise Linux. In the default configuration, these configuration files are processed first.

## Validando arquivos de configuração

```apachectl configtest```

## Comandos básicos do Apache

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

## Configurando Virtual Hosts

To create a name-based virtual host, copy the example configuration file /usr/share/doc/httpd/httpd-vhosts.conf into the /etc/httpd/conf.d/ directory. 

```
<VirtualHost *:80>
    ServerAdmin webmaster@penguin.example.com
    DocumentRoot "/www/docs/penguin.example.com"
    ServerName penguin.example.com
    ServerAlias www.penguin.example.com
    ErrorLog "/var/log/httpd/dummy-host.example.com-error_log"
    CustomLog "/var/log/httpd/dummy-host.example.com-access_log" common
</VirtualHost>
```

**Note**: ```ServerName``` must be a valid DNS name assigned to the machine.

## Habilitando TLS

```yum install mod_ssl openssl```

## Testando o status do TLS

```openssl s_client -connect hostname:port -protocol```

## Utilizando uma chave e certificado existentes

If you want to use an existing key and certificate, move the relevant files to the ```/etc/pki/tls/private/``` and ```/etc/pki/tls/certs/``` directories by issuing the following commands as root:

```mv key_file.key /etc/pki/tls/private/hostname.key```

```mv certificate.crt /etc/pki/tls/certs/hostname.crt```

Then add the following lines to the ```/etc/httpd/conf.d/ssl.conf``` configuration file:

```SSLCertificateFile /etc/pki/tls/certs/hostname.crt```

```SSLCertificateKeyFile /etc/pki/tls/private/hostname.key```

To load the updated configuration, restart the ```httpd``` service.
