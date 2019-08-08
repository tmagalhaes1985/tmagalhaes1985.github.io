# Docker

O Docker é uma plataforma para Desenvolvedores e SysAdmins rodarem containers. Rodar containers é legal porque eles são:

- **Flexíveis**: Até os aplicativos mais complexos podem rodar em containers
- **Leves**: containers aproveitam e compartilham o kernel do host Docker
- **Intercambiáveis**: você pode implantar atualizações e on-the-fly
- **Portáteis**: você pode rodar localmente, na nuvem ou em qualquer lugar
- **Escaláveis**: você pode aumentar e distribuir automaticamente as réplicas dos containers
- **Empilháveis**: você pode empilhar serviços verticalmente on-the-fly

## Instalação do Docker

1. Instale os pré-requisitos

    ```sudo yum install -y yum-utils device-mapper-persistent-data lvm2```

2. Instale o Docker

    ```curl -fsSL https://get.docker.com -o get-docker.sh```

    ```sudo sh get-docker.sh```

**OBS**: Para executar o Docker como usuário comum (sem privilégios root), adicione seu usuário ao grupo "docker"

    ```sudo usermod -aG docker $USER```

3. Configure o Docker para inializar automaticamente com o sistema

    ```sudo systemctl enable docker```

4. Inicie o serviço do Docker

    ```sudo systemctl start docker```

## Indo pro próximo nível: Docker Compose

O Docker Compose serve para executar apps com vários contêineres em múltiplos hosts Docker. Ele funciona pra todos os tipos de ambiente: produção, staging, desenvolvimento, teste, bem como para fluxos de integração contínua.

Seu uso se dá em três etapas:

1. Defina o ambiente do seu aplicativo com um Dockerfile para que ele possa ser reproduzido em qualquer lugar
2. Defina os serviços que compõem seu aplicativo num arquivo docker-compose.yml para que eles possam ser executados juntos em um ambiente isolado
3. Execute o docker-compose e seu aplicativo será completamente iniciado.



## Easy Tech Stack

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

## Self-Hosted Tech Stack

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

## Comparação dos caminhos do Docker em sistemas Linux e Windows

Diretórios importantes      |  Linux             | Windows
----------------------------|--------------------|---------------------------------------
binário do cliente          |  /usr/bin/docker   |  C:\Program Files\Docker\docker.exe
binário do daemon           |  /usr/bin/dockerd  |  C:\Program Files\Docker\dockerd.exe
configuração do servidor    |  /etc/docker       |  C:\ProgramData\docker\config
diretório de instalação     |  /var/lib/docker   |  C:\ProgramData\docker
arquivo hosts               |  /etc/hosts        |  C:\Windows\System32\drivers\etc\hosts
