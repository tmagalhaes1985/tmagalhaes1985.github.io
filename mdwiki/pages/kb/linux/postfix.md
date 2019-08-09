# [Postfix](http://www.postfix.org/)

## Sobre o Postfix

Postfix é um servidor de e-mail que começou a vida como uma alternativa ao Sendmail. O objetivo do Postfix é ser rápido, fácil de administrar e seguro.

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
