# Containers

## Docker

O Docker é uma runtime de containers, uma alternativa leve a máquinas virtuais, altamente portáveis e de fácil deploy e reprodução em escala.

1. Instale os pré-requisitos

    ```sudo yum install -y yum-utils device-mapper-persistent-data lvm2 py-pip python-dev libffi-dev openssl-dev gcc libc-dev make```

2. Instale o Docker

    ```curl -fsSL https://get.docker.com -o get-docker.sh```

    ```sudo sh get-docker.sh```

3. Para executar o Docker como usuário comum (sem privilégios root), adicione seu usuário ao grupo "docker"

    ```sudo usermod -aG docker $USER```

4. Configure o Docker para inicializar automaticamente com o sistema

    ```sudo systemctl enable docker && sudo systemctl start docker```

## Podman

O Podman é uma runtime de containers sem daemon. Você pode usar o Podman como substituto ao Docker.

1. Para instalar o Podman

    ```sudo yum -y install podman```

2. Se você já for acostumado com a sintaxe do Docker, adicione um alias para o Podman

    ```alias docker=podman```

## Docker Compose

O Docker Compose executa apps de vários contêineres em um ou mais hosts Docker. Ele funciona pra todos os tipos de ambiente: produção, staging, desenvolvimento, teste, bem como para fluxos de integração contínua.

1. Para instalar o Docker Compose

    ```sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose```

2. Dê permissão de execução ao binário do Docker Compose

    ```sudo chmod +x /usr/local/bin/docker-compose```

## Clusters Swarm

Swarms são hosts que executam o Docker em conjunto. Depois de adicionados um cluster Swarm, os hosts Docker são denominados nós.

O nó responsável pelo gerenciamento do cluster é denominado Manager, e é o único host que executa comandos no cluster, bem como autorizar outros nós a se juntarem ao cluster. Você instrui o Manager sobre como distribuir containers no arquivo Compose das suas aplicações:

- **emptiest node**: preenche as máquinas menos utilizadas com containers
- **global**: garante que cada nó do cluster obtenha exatamente uma instância do container especificado

1. Para criar um Manager para seu cluster

    ```docker swarm init```

## Adicionando Workers ao cluster Swarm

Workers fornecem capacidade de execução de containers, e não têm autoridade no cluster para executarem ações administrativas.

1. Para adicionar um Worker a um cluster Swarm, execute o seguinte comando no Manager

    ```docker swarm join-token worker```

2. Copie a saída do comando e execute em um Worker para adicioná-lo ao cluster Swarm

## Docker Stacks

Docker             | Easy Stack             | Self-Hosted Stack
-------------------|------------------------|------------------
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
----------------------------|--------------------|--------
binário do cliente          |  /usr/bin/docker   |  C:\Program Files\Docker\docker.exe
binário do daemon           |  /usr/bin/dockerd  |  C:\Program Files\Docker\dockerd.exe
configuração do servidor    |  /etc/docker       |  C:\ProgramData\docker\config
diretório de instalação     |  /var/lib/docker   |  C:\ProgramData\docker
arquivo hosts               |  /etc/hosts        |  C:\Windows\System32\drivers\etc\hosts

## Quando usar o Buildah e quando usar o Podman

Comando             | Comportamento do Podman       | Comportamento do Buildah
--------------------|-------------------------------|-----------------
build               | Calls buildah bud             | Provides the build-using-dockerfile (bud) command that emulates Docker’s build command.
commit              | Commits a Podman container into a container image. Does not work on a Buildah container. Once committed the resulting image can be used by either Podman or Buildah.  | Commits a Buildah container into a container image. Does not work on a Podman container. Once committed, the resulting image can be used by either Buildah or Podman.
mount               | Mounts a Podman container. Does not work on a Buildah container.      | Mounts a Buildah container. Does not work on a Podman container.
pull and push       | Pull or push an image from a container image registry. Functionally the same as Buildah.  | Pull or push an image from a container image registry. Functionally the same as Podman.
run                 | Run a process in a new container in the same manner as docker run.    | Runs the container in the same way as the RUN command in a Dockerfile.
rm                  | Removes a Podman container. Does not work on a Buildah container.     | Removes a Buildah container. Does not work on a Podman container.
rmi, images, tag    | Equivalent on both projects.                                          | Equivalent on both projects.
containers and ps   | ps is used to list Podman containers. The containers command does not exist.  | containers is used to list Buildah containers. The ps command does not exist.
