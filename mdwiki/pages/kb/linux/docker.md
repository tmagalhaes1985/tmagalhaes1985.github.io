# Docker

## Sobre o Docker

O Docker é uma plataforma para Desenvolvedores e SysAdmins rodarem containers. Containers são uma tecnologia interessante porque são:

- **Flexíveis**: Até aplicativos complexos podem rodar em containers
- **Leves**: Aproveitam e compartilham o kernel do host Docker
- **Intercambiáveis**: Você pode implantar atualizações e on-the-fly
- **Portáteis**: Você pode rodar localmente, na nuvem ou em qualquer lugar
- **Escaláveis**: Você pode aumentar e distribuir automaticamente as réplicas dos containers de acordo com a demanda dos seus usuários
- **Empilháveis**: Você pode empilhar serviços verticalmente on-the-fly

## Instalação do Docker

1. Instale os pré-requisitos

    ```sudo yum install -y yum-utils device-mapper-persistent-data lvm2 py-pip python-dev libffi-dev openssl-dev gcc libc-dev make```

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

### Instalando o Docker Compose

```sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose```

```sudo chmod +x /usr/local/bin/docker-compose```

## Tech Stacks

Docker             | Easy Tech Stack        | Self-Hosted Tech Stack
-------------------|------------------------|--------------------------
Swarm GUI          | Portainer              | Portainer
Central Monitoring | Librato, Sysdig        | Prometheus + Grafana
Central Logging    | Docker for AWS/Azure   | ELK
Layer 7 Proxy      | Flow-Proxy, Traefik    | Flow-Proxy, Traefik
Registry           | Docker Hub, Quay       | Docker Distribution + Portus
CI/CD              | Codeship, TravisCI     | Jenkins
Storage            | Docker for AWS/Azure   | REX-Ray
Networking         | Docker Swarm           | Docker Swarm
Orchestration      | Docker Swarm           | Docker Swarm
Runtime            | Docker                 | Docker
HW/OS              | Docker for AWS/Azure   | InfraKit, Terraform

## Comparação dos caminhos do Docker em sistemas Linux e Windows

Diretórios importantes      |  Linux             | Windows
----------------------------|--------------------|---------------------------------------
binário do cliente          |  /usr/bin/docker   |  C:\Program Files\Docker\docker.exe
binário do daemon           |  /usr/bin/dockerd  |  C:\Program Files\Docker\dockerd.exe
configuração do servidor    |  /etc/docker       |  C:\ProgramData\docker\config
diretório de instalação     |  /var/lib/docker   |  C:\ProgramData\docker
arquivo hosts               |  /etc/hosts        |  C:\Windows\System32\drivers\etc\hosts
