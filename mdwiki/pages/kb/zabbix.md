# Zabbix

## Implantação do Zabbix Appliance em um container

O Zabbix Appliance consiste na aplicação + banco de dados numa única solução.

```curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USERNAME
systemctl enable docker && systemctl start docker
docker run --name Zabbix-Appliance -d -p 80:80 -p 10051:10051 -d zabbix/zabbix-appliance:alpine-trunk
```

Depois de rodar todos os comandos acima, basta esperar alguns minutos e abrir o Zabbix no navegador: ```http://<server>:80```

- **User**: admin
- **Pass**: zabbix

(Troquem ```<server>``` pelo IP ou hostname do servidor aonde você instalou o Zabbix)

## Instalação do serviço de monitoramento do Zabbix em máquinas Linux

Para instalar o serviço de monitoramento do Zabbix em máquinas Windows, basta executar os comandos abaixo:

```yum -y install zabbix-agent```

```systemctl start zabbix-agent```

## Instalação do serviço de monitoramento do Zabbix em máquinas Windows

Para instalar o serviço de monitoramento do Zabbix em máquinas Windows, basta executar a linha abaixo (considerando que você instalou os binários do Zabbix no diretório C:\Zabbix):

```C:\Zabbix\4.2\bin\zabbix_agentd.exe --config C:\Zabbix\4.2\conf\zabbix_agentd.win.conf --install```
