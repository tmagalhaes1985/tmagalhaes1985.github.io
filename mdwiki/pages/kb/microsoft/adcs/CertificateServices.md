# Serviços de Certificado

## Sobre os Serviços de Certificado

Os Serviços de Certificado Microsoft atua recebendo solicitações de novos certificados digitais de computadores da rede.

Ele verifica cada solicitação com base em políticas específicas, e define propriedades opcionais para que um certificado seja emitido, e por fim emite o certificado, além de permitir que os administradores adicionem elementos a uma lista de revogação de certificado (CRL) e publiquem CRLs assinadas regularmente.

Ele possui recursos flexíveis para empresas que precisam de uma PKI que consiga gerar certificados de acordo com a sua necessidade:

- Integração com o Active Directory
- Adesão a padrões
- Utilizável por aplicativos
- Estrutura extensível
- Suporte a criptografia de hardware
- Suporte a hierarquia
- Informação de independência de política
- Suporte a requisições
- Independência de transporte de rede

## Arquitetura

![Cert API](/mdwiki/pages/kb/microsoft/adcs/certapi.png)

## Infraestrutura

Os Serviços de Certificados são a base da Infraestrutura de Chave Pública Microsoft (PKI).

Essa infraestrutura de PKI é composta pelos seguintes componentes:

- O par de chaves pública/privada
- A requisição de certificado (certificate request)
- A autoridade de certificação (CA)
- O certificado
- A lista de revogação de certificados (CRL)
- Sua chave pública usada para criptografia (cipher)
- Sua chave pública usada para verificação de assinatura (digital signature)
- Serviços de Certificados Microsoft

## Fluxo de requisições de certificados

![Cert Flow](/mdwiki/pages/kb/microsoft/adcs/certflow.png)

## Formatos de certificados suportados

Termo       | Descrição
------------|----------
Certificado de autenticação de cliente X.509 compatível com SSL3 | Esse certificado identifica um cliente e é usado por servidores para autenticar um cliente que solicitam acesso ao servidor.
Certificado de autenticação de servidor X.509 compatível com SSL3 | Esse certificado identifica um servidor e é usado pelos clientes para autenticar um servidor que o cliente deseja acessar.
Certificado S/MIME | Este certificado é usado por clientes para e-mail seguro no protocolo S/MIME (Secure/Multipurpose Internet Mail Extensions).
