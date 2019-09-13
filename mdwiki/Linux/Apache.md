# Apache

## Instalação e gerenciamento do serviço Web

### Instalação RHEL/CentOS 7

```sudo yum install httpd httpd-manual```

### Instalação RHEL/CentOS 8

```sudo yum module install httpd```

### Habilitando o serviço na inicialização

```sudo systemctl enable httpd```

### Inicializando o serviço

```sudo systemctl start httpd```

### Interrompendo o serviço

```sudo systemctl stop httpd```

### Reiniciando o serviço

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

Para criar um host virtual baseado em nome, copie o arquivo de configuração de exemplo ```/usr/share/doc/httpd/httpd-vhosts.conf``` no diretório ```/etc/httpd/conf.d/```.

```bash
<VirtualHost *:80>
    ServerAdmin webmaster@penguin.example.com
    DocumentRoot "/www/docs/penguin.example.com"
    ServerName penguin.example.com
    ServerAlias www.penguin.example.com
    ErrorLog "/var/log/httpd/dummy-host.example.com-error_log"
    CustomLog "/var/log/httpd/dummy-host.example.com-access_log" common
</VirtualHost>
```

** Nota **: ```ServerName``` deve ser um nome DNS válido atribuído à máquina.

## Habilitando TLS

```yum install mod_ssl openssl```

## Testando o status do TLS

```openssl s_client -connect hostname:port -protocol```

## Utilizando uma chave e certificado existentes

Se você deseja usar uma chave e um certificado existentes, mova os arquivos relevantes para os diretórios ```/etc/pki/tls/private/``` e ```/etc/pki/tls/certs/``` executando os seguintes comandos como root:

```mv key_file.key /etc/pki/tls/private/hostname.key```

```mv certificate.crt /etc/pki/tls/certs/hostname.crt```

Em seguida, adicione as seguintes linhas ao arquivo de configuração ```/etc/httpd/conf.d/ssl.conf```:

```SSLCertificateFile /etc/pki/tls/certs/hostname.crt```

```SSLCertificateKeyFile /etc/pki/tls/private/hostname.key```

Para carregar a configuração atualizada, reinicie o serviço ```httpd```.
