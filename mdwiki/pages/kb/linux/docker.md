# Docker

## Sobre o Docker

O Docker é uma plataforma para Desenvolvedores e SysAdmins rodarem containers.

Containers são:

- **Flexíveis**: Até aplicativos complexos podem rodar em containers
- **Leves**: Aproveitam e compartilham o kernel do host Docker
- **Intercambiáveis**: Você pode implantar atualizações e on-the-fly
- **Portáveis**: Você pode rodar localmente, na nuvem ou em qualquer lugar
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

## Docker Compose

O Docker Compose serve para executar apps com vários contêineres em múltiplos hosts Docker. Ele funciona pra todos os tipos de ambiente: produção, staging, desenvolvimento, teste, bem como para fluxos de integração contínua.

Seu uso se dá em três etapas:

1. Defina o ambiente do seu aplicativo com um Dockerfile para que ele possa ser reproduzido em qualquer lugar
2. Defina os serviços que compõem seu aplicativo num arquivo docker-compose.yml para que eles possam ser executados juntos em um ambiente isolado
3. Execute o docker-compose e seu aplicativo será completamente iniciado.

## Instalando o Docker Compose

```sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose```

```sudo chmod +x /usr/local/bin/docker-compose```

## Clusters Swarm

Um cluster Swarm é um grupo de máquinas que executam o Docker em conjunto. Os hosts Docker membros de um Swarm podem ser físicos ou virtuais. Depois de adicionados ao cluster Swarm, os hosts Docker são chamados de nós.

O Manager (nó responsável pelo gerenciamento do cluster) utiliza estratégias para execução dos containers. Você instrui o Manager sobre como usar essas estratégias no arquivo Compose da sua aplicação:

- **emptiest node**: preenche as máquinas menos utilizadas com containers
- **global**: garante que cada nó do cluster obtenha exatamente uma instância do container especificado

O Manager é a única máquina que pode executar comandos ou autorizar outras máquinas a se juntarem ao cluster como Workers. Os Workers fornecem apenas capacidade de execução de containers, e não têm autoridade no cluster para dizer a qualquer outro nó o que pode ou não ser feito.

1. Para criar um Manager para seu cluster

    ```docker swarm init```.

## Adicionando nós ao cluster Swarm

1. Para adicionar nós a um cluster Swarm, execute no Manager

    ```docker swarm join-token worker```

2. Copie a saída do comando e execute em um Worker. A saída será algo parecido com

     ```docker swarm join --token SWMTKN-1-5tl7yaasdfd9qt9j0easdfnml4lqbosbasf14p13-f3hem9ckmkhasdf3idrzk5gz 192.168.0.100:2377```

## Docker Stacks

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

## Comparação dos paths em sistemas Linux e Windows

Diretórios importantes      |  Linux             | Windows
----------------------------|--------------------|---------------------------------------
binário do cliente          |  /usr/bin/docker   |  C:\Program Files\Docker\docker.exe
binário do daemon           |  /usr/bin/dockerd  |  C:\Program Files\Docker\dockerd.exe
configuração do servidor    |  /etc/docker       |  C:\ProgramData\docker\config
diretório de instalação     |  /var/lib/docker   |  C:\ProgramData\docker
arquivo hosts               |  /etc/hosts        |  C:\Windows\System32\drivers\etc\hosts
