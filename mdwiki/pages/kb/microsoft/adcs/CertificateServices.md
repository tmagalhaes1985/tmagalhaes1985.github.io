# Serviços de Certificado

## Sobre os Serviços de Certificado

Os Serviços de Certificado do Active Directory é um serviço que recebe solicitações de novos certificados digitais.

Ele verifica cada solicitação em relação a políticas específicas, define propriedades opcionais para que um certificado seja emitido e emite o certificado, além de permitir que os administradores adicionem elementos a uma lista de revogação de certificado (CRL) e publiquem CRLs assinadas regularmente.

Ele possui vários recursos que o tornam valioso para organizações que não optam por depender de autoridades de certificação externas e que precisam de uma ferramenta flexível que possa ser adaptada às necessidades da organização. As seções a seguir fornecem detalhes específicos:

- Integração com o Active Directory
- Adesão aos padrões
- Utilizável por aplicativos
- Estrutura extensível
- Suporte a criptografia de hardware
- Suporte a hierarquia
- Informação de independência de política
- Suporte a requisições
- Independência de meio de transporte

## Arquitetura

![Cert API](/mdwiki/pages/kb/microsoft/adcs/certapi.png)

## Certificados e chaves públicas

Os Serviços de Certificados são a base da Infraestrutura de Chave Pública Microsoft (PKI), que fornece os meios para proteger e autenticar as informações.

O relacionamento entre um detentor de certificado, a identidade do detentor de certificado e a chave pública do detentor de certificado é uma parte crítica da PKI.

Essa infraestrutura é composta das seguintes partes:

- O par de chaves pública/privada
- A requisição de certificado (certificate request)
- A autoridade de certificação (CA)
- O certificado em si
- A lista de revogação de certificados (CRL)
- Sua chave pública usada para criptografia (cipher)
- Sua chave pública usada para verificação de assinatura (digital signature)
- Serviços de Certificados Microsoft

### Processando requisições de certificados

Uma requisição de certificado sempre segue o seguinte fluxo:

1. O cliente requisita o certificado
2. O administrador aprova a requisição do certificado
3. A CA gera o certificado
4. A CA publica o certificado

![Cert Flow](/mdwiki/pages/kb/microsoft/adcs/certflow.png)

### Geração de certificados

A ordem das chamadas na criação de um certificado é a seguinte:

1. A CA inicializa os módulos por meio de chamadas para ```ICertPolicy``` e ```ICertExit```
2. A intermediária encontra a cadeia de configuração necessária chamando ```ICertConfig :: GetConfig```.
3. O cliente envia uma solicitação de certificado ao intermediário (por exemplo, o navegador Web enviando uma solicitação por meio do Controle de Registro de Certificado para o IIS)
4. A intermediária envia a solicitação de certificado para a CA por meio de ```ICertRequest :: Submit```. No caso do IIS, isso pode ser feito por meio de scripts
5. A CA notifica o módulo de política que uma solicitação chegou chamando ```ICertPolicy :: VerifyReques```t. O módulo de política pode, então, indicar que a solicitação está OK (em caso afirmativo, o certificado é criado neste momento), ou informar que a solicitação deve ser negada ou suspensa.
6. Se o módulo de saída indicou (no item 1.) que está interessado em ver certificados emitidos ou solicitações pendentes, a autoridade de certificação chamará ```ICertExit :: Notify```.
7. O módulo de saída chama a CA para examinar a solicitação e o novo certificado chamando métodos de ```ICertServerExit```.

### Formatos de certificados suportados

Termo       | Descrição
------------|----------
Certificado de autenticação de cliente X.509 compatível com SSL3 | Esse certificado identifica um cliente e é usado por servidores para autenticar um cliente que solicitam acesso ao servidor.
Certificado de autenticação de servidor X.509 compatível com SSL3 | Esse certificado identifica um servidor e é usado pelos clientes para autenticar um servidor que o cliente deseja acessar.
Certificado S/MIME | Este certificado é usado por clientes para e-mail seguro no protocolo S/MIME (Secure/Multipurpose Internet Mail Extensions).
