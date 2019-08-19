# Postfix

## Sobre o Postfix

Postfix é um servidor de e-mail que começou a vida como uma alternativa ao Sendmail. O objetivo do Postfix é ser rápido, fácil de administrar e seguro.

## Instalação do Postfix

```yum -y install postfix```

## Iniciar o serviço do Postfix

```systemctl start postfix```

## Instalação do SpamAssassin

```yum -y install spamassassin```

## Iniciar o serviço do SpamAssassin

```systemctl start spamassassin```

## DKIM

```yum install opendkim```

```bash
cat <<EOF > /etc/opendkim.conf
PidFile             /var/run/opendkim/opendkim.pid
Mode                sv
Syslog              yes
SyslogSuccess       yes
LogWhy              yes
UserID              opendkim:opendkim
Socket              inet:8891@localhost
Umask               002
Canonicalization    relaxed/relaxed
Selector            default
MinimumKeyBits      1024
KeyTable            refile:/etc/opendkim/KeyTable
SigningTable        refile:/etc/opendkim/SigningTable
ExternalIgnoreList  refile:/etc/opendkim/TrustedHosts
InternalHosts       refile:/etc/opendkim/TrustedHosts
EOF
```

```bash
cat <<EOF > /etc/opendkim/TrustedHosts
127.0.0.1
::1
mail.seudominio.com
EOF
```

```bash
echo "default._domainkey.seudominio.com seudominio.com:default:/etc/opendkim/keys/seudominio.com.private" > /etc/opendkim/KeyTable
```

```bash
echo "*@seudominio.com default._domainkey.seudominio.com" > /etc/opendkim/SigningTable
```

```systemctl restart opendkim```

```bash
cat <<EOF >> /etc/postfix/main.cf
echo milter_default_action = accept
smtpd_milters = inet:127.0.0.1:8891
EOF
```

```systemctl restart postfix```

**Finalmente, o passo mais importante**: publicar suas chaves públicas no DNS

```opendkim-genkey -D /etc/opendkim/keys/ -d seudominio.com -s seudominio.com```

## Teste de envio de e-mail com cURL

```bash
curl --mail-from user1@domain.local --mail-rcpt user2@domain.local smtp://mail.domain.local
```

Uma vez que o comando acima foi inserido, ele irá aguardar a entrada do usuário para envio do e-mail. Uma vez que a mensagem for concluída, digite "." (sem aspas) na última linha e tecle Enter para que o e-mail seja enviado imediatamente.

```bash
Subject: Teste
Este é um e-mail de teste.
.
```

## Teste de envio de e-mail com Telnet

```bash
telnet mail.domain.local 25
EHLO mpes.mp.br
mail from:user1@domain.local
rcpt to:user2@domain.local
DATA
Subject:Teste
Este é um e-mail de teste.
.
```
