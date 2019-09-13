# Hardening de Equipamentos

É um procedimento para:

- Analisar vulnerabilidades
- Mapear as ameaças
- Minimizar/mitigar riscos
- Aplicar medidas corretivas
- Proteger ataques vindos de terceiros
- Impedir que seus equipamentos façam ataques em outros

## Recomendações

### Autenticação

- Criar um usuário para cada funcionário: desative contas antigas e inutilizadas
- Não deixe os funcionários utilizarem a mesma conta padrão de administração do sistema
- Guarde o acesso padrão somente para backup e emergências
- Não permita senhas fracas de acesso
- O CERT.br possui fascículo sobre: <https://cartilha.cert.br/fasciculos/senhas/fasciculo-senhas.pdf>
- Não armazena sua senhas em texto puro: use funções hash (PBKDF2, Bcrypt, Scrypt e Argon2)
- Aplique técnicas de autenticação em 2 fatores:
  - Coisas que eu **sei**: Senhas
  - Coisas que eu **sou**: Biometria
  - Coisas que eu **possuo**: Chave
- Colocar duas senhas não caracteria autenticação em 2 fatores
- O CERT.br possui fascículo sobre: <https://cartilha.cert.br/fasciculos/verificacao-duas-etapas/fasciculo-verificacao-duas-etapas.pdf>

### Autorização

- Cada usuário deve ter permissão para acessar equipamentos de acordo com o seu trabalho
  - Não forneça acesso administrador para todos o seus usuários
  - Pense no que seu estagiário/agente malicioso poderia fazer no seu sistema
- Em alguns sistemas pode se criar grupos de privilégios
- Em alguns sistemas é possível escalar privilégios

### Auditoria

- Manter um registro de cada usuário com suas respectivas permissões
- Registrar as ações de cada usuário no sistema
- Operar com nível de criticidade nos registros:
  - Informativo
  - Aviso
  - Crítico
- Tipos de registros
  - Documentos
  - Logs
  - Backups de configuração
  - Evite gerenciar logs dentro dos equipamentos. Quanto mais funções o equipamento tiver que fazer, menos processamento será utilizado para o trabalho final.
- Envie de maneira segura os logs para uma outra máquina, pois algum agente malicioso pode interceptar
- Armazene seus logs de maneira segura, pois eles podem te ajudar num processo judicial
- Armazene informações para auditoria.
  - Log de ações e comandos indevidos
  - Log de tentativas de acesso ajudam a identificar:
    - Ataques de força bruta
    - Ataques de negação de serviço
    - Tentativa de roubo de informações
  - É possível criar políticas de mitigação de ataque (Ex.: Filtros, Blackhole)
- Sincronize horários dos dispositivos com o NTP.br para guardar a informação com a data e hora certa

### Acesso

- Não utilize protocolos inseguros (Ex.: Telnet, FTP, HTTP) para acesso.
- Desative-os se eles estiverem operando.
- Se for o único meio de acesso a máquina, restrinja o alcance para somente ser utilizada pela interface de gerencia (uma rede apartada e protegida)
- Utilize preferencialmente protocolos criptografados (Ex.:SSH, SFTP, HTTPS) em sua última versão estável disponível
- SSH v2 com strong crypto
- Adicione uma mensagem de login.
  - Existem governos que exigem essas mensagens para o âmbito legal.
  - Exemplo:

    ```Roteador pertencente a empresa X, acessos não autorizados serão monitorados, investigados e entregues às autoridades responsáveis```

- Mudar a porta padrão do serviço de acesso
- Bloquear acesso a porta padrão não é bem uma proteção, mas pode ajudar contra um ataque simples que procura portas padrão
- Não permita acesso por todas as interfaces.
- Escolha uma interface de loopback para os seus serviços
  - São mais estáveis.
  - Não sofrem com variações no link.
  - Caso uma interface física fique indisponível os protocolos de roteamento procuram um novo caminho.
- Faça essa interface parte da sua rede de gerência
- Forçar o logout depois de um tempo de inatividade.
  - Isso evita que alguém use sua máquina em seu período ausente.
  - Isso evita que um atacante monitore o seu tempo de inatividade para tomar controle da máquina.
- Forçar o logout depois de se desconectar o cabo, isso evita que alguém reconecte o cabo e use o seu login.
- Port Knocking
  - Nenhuma porta aparece aberta no scan
  - Diminui a superfície de ataques
  - Para acessar um serviço:
    - Testar uma sequência de portas fechadas
    - Configurar a mudança de regras de Firewall dinamicamente
    - Conectar na porta desejada

### Sistemas

- Desative logicamente quaisquer interfaces não utilizadas (Ex.: interfaces que não possuem cabos conectados)
- Desative todas os serviços não utilizadas, inseguros, e que possam ser utilizados para ataques de amplificação
  - Testador de banda
  - DNS recursivo
  - Servidor NTP
- Remova ou desative os pacotes de funções extras não utilizados.
- Desabilite protocolos de descoberta de vizinhança, como CDP, MNDP e LLDP, pois facilitam para o atacante descobrir o tipo do seu equipamento, além de inundar sua rede com mensagens desnecessárias.
- **Atenção com o IPv6**: protocolos de descoberta de vizinhança são essenciais no mundo IPv6, sem eles nada funciona
- Mantenha o sistema sempre atualizado na versão estável, incluindo seus pacotes e patches de segurança
- Procure testar as atualizações num ambiente controlado antes de aplicar em produção

### Configurações

- Mantenha sempre um backup atualizado das configurações atuais
- Envie de maneira segura esse backup para uma outra máquina via SCP ou SFTP
- Guarde esse backup numa máquina segura, o operacional da sua empresa estará guardado lá!
- Hashes de senhas podem ser quebrados
- Mantenha um script de hardening de equipamentos, assim ao comprar um novo equipamento, você saberá as políticas mínimas de segurança que precisam ser
aplicadas
- Mantenha esse script atualizado. Cada nova política precisa ser agregada ao script

## Spoofing

- Pacotes IP com endereços de origem incorretos
- Erro de configuração / Problema de Software
- Teste e Simulação de Performance
- Atitudes maliciosas:
  - Esconder a identidade do atacante
  - Fingir ser outro computador na rede
- O spoofing pode ser usado em ataques de negação de serviço (DDoS) e é um problema sériona Internet

Como funciona o ataque spoofing:

![spoofing](/mdwiki/pages/kb/networking/spoofing.png)

Como funciona o ataque reflexão-amplificação:

![reflexão-amplificação](/mdwiki/pages/kb/networking/reflexion-amplification.png)

### Fatores de amplificação

Protocolo       | Fator de Amplificação | Comando Vulnerável
----------------|-----------------------|-------------------
DNS             | 28 a 54               | Ver: TA13-088A
NTP             | 556.9                 | Ver: TA14-013A
SNMPv2          | 6.3                   | GetBulk request
LDAP / CLDAP    | 46 a 70               | Malformed request
SSDP            | 30.8                  | SEARCH request
Chargen         | 358.8                 | Character generation request

### Ferramentas de linha de comando

- [DIG](https://www.isc.org/community/tools/)

    ```$ dig +bufsize=4096 @<ip-servidor-aberto> <domínio> ANY```

- NTP

    ```$ ntpdc -n -c monlist <ip-servidor-aberto>```

    ```$ ntpq -c rv <ip-servidor-aberto>```

- SNMP

    ```snmpget -v 2c -c public <ip-servidor-aberto> iso.3.6.1.2.1.1.1.0```

    ```snmpctl snmp get <ip-servidor-aberto> oid iso.3.6.1.2.1.1.1.0```

    ```snmpwalk -v 2c -c public <ip-servidor-aberto>```

- SSDP

    ```bash
    $ printf "M-SEARCH *

    HTTP/1.1\r\nHost:239.255.255.250:1900\r\nST:upnp:rootdevice\r\nMan:\"ssdp:dis
    cover\"\r\nMX:3\r\n\r\n" | nc -u <ip-servidor-aberto> 1900
    ```

- Chargen

    ```$ echo | nc -u <ip-servidor-aberto> 19```

## MANRS

- Acrônimo para Mutually Agreed Norms for Routing Security
- Iniciativa global com apoio da ISOC
- Consiste em 4 coisas básicas
  - Filtros (previne roubos de prefixos)
  - Anti-Spoofing
  - Coordenação
  - Validação Global
