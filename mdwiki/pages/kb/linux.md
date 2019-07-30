# Linux Knowledge Base

## Teste de envio de e-mail com cURL

```bash
curl --mail-from jbarigui@mpes.mp.br --mail-rcpt tmagalhaes@mpes.mp.br smtp://correio.mpes.gov.br
```

Uma vez que o comando acima foi inserido, ele irá aguardar a entrada do usuário para envio do e-mail. Uma vez que a mensagem for concluída, digite __"."__ (sem aspas) na última linha, para que o e-mail seja enviado imediatamente.

```bash
Subject: Teste
Este é um e-mail de teste.
.
```

## Teste de envio de e-mail com Telnet

```bash
telnet correio.mpes.mp.br 25
EHLO mpes.mp.br
mail from:jbarigui@mpes.mp.br
rcpt to:tmagalhaes@mpes.mp.br
DATA
Subject:Teste
Este é um e-mail de teste.
.
```

## Docker

### Easy Tech Stack

Docker             | Easy Tech Stack
-------------------|----------------------------
Swarm GUI          | Portainer
Central Monitoring | Librato, Sysdig
Central Logging    | Docker for AWS/Azure
Layer 7 Proxy      | Flow-Proxy, Traefik
Registry           | Docker Hub, Quay
CI/CD              | Codeship, TravisCI
Storage            | Docker for AWS/Azure
Networking         | Docker Swarm
Orchestration      | Docker Swarm
Runtime            | Docker
HW/OS              | Docker for AWS/Azure

### Self-Hosted Tech Stack

Docker             | Self-Hosted Tech Stack
-------------------|----------------------------
Swarm GUI          | Portainer
Central Monitoring | Prometheus + Grafana
Central Logging    | ELK
Layer 7 Proxy      | Flow-Proxy, Traefik
Registry           | Docker Distribution + Portus
CI/CD              | Jenkins
Storage            | REX-Ray
Networking         | Docker Swarm
Orchestration      | Docker Swarm
Runtime            | Docker
HW/OS              | InfraKit, Terraform

Diretórios importantes    |  Linux             | Windows
--------------------------|--------------------|---------------------------------------
client binary             |  /usr/bin/docker   |  C:\Program Files\Docker\docker.exe
daemon binary             |  /usr/bin/dockerd  |  C:\Program Files\Docker\dockerd.exe
daemon config             |  /etc/docker       |  C:\ProgramData\docker\config
data root dir             |  /var/lib/docker   |  C:\ProgramData\docker
host file                 |  /etc/hosts        |  C:\Windows\System32\drivers\etc\hosts
