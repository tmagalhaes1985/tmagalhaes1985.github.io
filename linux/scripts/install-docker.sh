#!/bin/bash

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo systemctl enable docker && sudo systemctl start docker

# Docker Compose

# Check at https://github.com/docker/compose/releases/latest which is the latest version available
COMPOSE_VERSION="1.25.4"

sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

: '
# Docker Stacks

Docker                 | Easy Stack             | Self-Hosted Stack
-----------------------|------------------------|------------------
Swarm GUI              | Portainer              | Portainer
Central Monitoring     | Librato, Sysdig        | Prometheus + Grafana
Central Logging        | Docker for AWS/Azure   | ELK
Layer 7 Proxy          | Flow-Proxy, Traefik    | Flow-Proxy, Traefik
Registry               | Docker Hub, Quay       | Docker Distribution + Portus
CI/CD                  | Codeship, TravisCI     | Jenkins
Storage                | Docker for AWS/Azure   | REX-Ray
Networking             | Docker Swarm           | Docker Swarm
Orchestration          | Docker Swarm           | Docker Swarm
Runtime                | Docker                 | Docker
HW/OS                  | Docker for AWS/Azure   | InfraKit, Terraform

# Docker path comparison between Linux and Windows

Use case               |  Linux                 | Windows
-----------------------|------------------------|--------
client binary          |  /usr/bin/docker       |  C:\Program Files\Docker\docker.exe
daemon binary          |  /usr/bin/dockerd      |  C:\Program Files\Docker\dockerd.exe
server configuration   |  /etc/docker           |  C:\ProgramData\docker\config
install dir            |  /var/lib/docker       |  C:\ProgramData\docker
hosts file             |  /etc/hosts            |  C:\Windows\System32\drivers\etc\hosts
'