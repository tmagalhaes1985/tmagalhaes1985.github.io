# Hyper-V

## Sobre o Hyper-V

O Hyper-V permite executar vários sistemas operacionais como máquinas virtuais no Windows, fornecendo a virtualização de hardware.

Isso significa que cada máquina virtual é executada em hardware virtual. O Hyper-V permite que você crie discos rígidos virtuais, comutadores virtuais e um número de outros dispositivos virtuais que podem ser adicionados a máquinas virtuais.

## Implantação do Hyper-V

```Install-WindowsFeature -name MultiPath-io,Hyper-V,Data-Center-Bridging,Failover-Clustering```

## Chaves de produto para ativação de máquinas virtuais

VERSÃO                                   |   CHAVE
-----------------------------------------|-------------------------------------------
Windows Server 2019 Datacenter           |   slmgr /ipk H3RNG-8C32Q-Q8FRX-6TDXV-WMBMW
Windows Server 2019 Standard             |   slmgr /ipk TNK62-RXVTB-4P47B-2D623-4GF74
Windows Server 1809 Datacenter           |   slmgr /ipk H3RNG-8C32Q-Q8FRX-6TDXV-WMBMW
Windows Server 1809 Standard             |   slmgr /ipk TNK62-RXVTB-4P47B-2D623-4GF74
Windows Server 1803 and 1709 Datacenter  |   slmgr /ipk TMJ3Y-NTRTM-FJYXT-T22BY-CWG3J
Windows Server 1803 and 1709 Standard    |   slmgr /ipk C3RCX-M6NRP-6CXC9-TW2F2-4RHYD
Windows Server 2016 Datacenter           |   slmgr /ipk TMJ3Y-NTRTM-FJYXT-T22BY-CWG3J
Windows Server 2016 Standard             |   slmgr /ipk C3RCX-M6NRP-6CXC9-TW2F2-4RHYD
Windows Server 2012 R2 Datacenter        |   slmgr /ipk Y4TGP-NPTV9-HTC2H-7MGQ3-DV4TW
Windows Server 2012 R2 Standard          |   slmgr /ipk DBGBW-NPF86-BJVTX-K3WKJ-MTB6V

**OBS**: Para validar chave do Windows Server imediatamente, execute o comando ```slmgr /ato```.

## Remover IP's travados no VMM

```$IPAddressPool = Get-SCStaticIPAddressPool -IPv4 -Subnet "10.0.0.0/8"```
```$IPAddress = Get-SCIPAddress -StaticIPAddressPool $IPAddressPool```
```ForEach ($ip in $IPAddress) {Revoke-SCIPAddress -AllocatedIPAddress $ip}```

## Configuração inicial do Windows Server Core com o comando Sconfig.cmd

A configuração básica do Windows Server Core se dá através do comando Sconfig.cmd. As opções que precisam ser alteradas estão em negrito.

Lembre-se que é necessário reiniciar o servidor após sua inclusão no domínio e troca de hostname, portanto é recomendado executar estes passos por último. O processo de inclusão do servidor no domínio questiona sobre a troca do hostname, portanto ambos podem ser feitos simultaneamente através da opção 1.

```powershell
C:\> sconfig.cmd
Microsoft (R) Windows Script Host Version 5.812
Copyright (C) Microsoft Corporation. All rights reserved.

Inspecting system...


===============================================================================
                         Server Configuration
===============================================================================

1) Domain/Workgroup:                    Domain:  <meudominio.com>
2) Computer Name:                       <Computer Name>
3) Add Local Administrator
4) Configure Remote Management          Enabled

5) Windows Update Settings:             <Manual>
6) Download and Install Updates
7) Remote Desktop:                      <Enabled (all clients)>

8) Network Settings
9) Date and Time
10) Telemetry settings                  Unknown
11) Windows Activation

12) Log Off User
13) Restart Server
14) Shut Down Server
15) Exit to Command Line

Enter number to select an option:
```

##Instalação do Hyper-V através do cmdlet Install-WindowsFeature

Como o Windows Server Core não possui interace gráfica, toda a instalação dos seus recursos se dá através de comandos em PowerShell.

Dessa forma, primeiro entre no PowerShell (basta digitar powershell no Prompt de Comando) e execute o comando abaixo:

```PS C:\> Install-WindowsFeature -Name Multipath-io,Hyper-V,Failover-Clustering,Data-Center-Bridging -IncludeManagementTools```

## Instalação do MPIO e DSM's dos storages HP no Windows Server Core

Após a instalação do MPIO através do PowerShell, é necessário instalar os DSM's dos storages HP existentes na infraestrutura do MPES.

Para isso, basta executar o comando abaixo e reiniciar o servidor.

```mpclaim -r -i -a "HP MSA2" "HP HSV300" "3PARdataVV"```

## Adicionar o usuário Run As do VMM ao grupo local de Administradores do servidor

O VMM precisa de permissões administrativas locais para o usuário Run As nos hosts Hyper-V, portanto aqui vamos adicionar o usuário de serviço ```svc_SCVMM_runas``` ao domínio de Administradores locais de cada servidor através do PowerShell.

**OBS**: Esta configuração também pode ser realizada através de Políticas de Grupo.

```PS C:\> Add-LocalGroupMember -Group "Administrators" -Member "svc_scvmm_runas"```

## Criar um NIC Teaming (LACP) para Heartbeat do cluster de failover no Windows Server Core

Para que os hosts Hyper-V sejam corretamente incluídos ao Cluster de Failover KIRYU, se faz necessário configurar o LACP das portas 3 e 4. Esta configuração pode ser feita através do seguinte comando em PowerShell:

```PS C:\> New-NetLbfoTeam -Name "Heartbeat" -TeamMembers "Embedded FlexibleLOM 1 Port 3","Embedded FlexibleLOM 1 Port 4"```
