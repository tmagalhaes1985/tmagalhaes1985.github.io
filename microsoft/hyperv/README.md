# Hyper-V

## Hyper-V best practice setup

```Install-WindowsFeature -name MultiPath-io,Hyper-V,Data-Center-Bridging,Failover-Clustering -IncludeManagementTools```

## AVMA activation keys

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

**Note**: To validate immediately, run ```slmgr /ato```

## Remove locket IP's on VMM

```$IPAddressPool = Get-SCStaticIPAddressPool -IPv4 -Subnet "10.0.0.0/8"```
```$IPAddress = Get-SCIPAddress -StaticIPAddressPool $IPAddressPool```
```ForEach ($ip in $IPAddress) {Revoke-SCIPAddress -AllocatedIPAddress $ip}```

## Initial Server Core configuration using Sconfig.cmd

```powershell
C:\> sconfig.cmd
Microsoft (R) Windows Script Host Version 5.812
Copyright (C) Microsoft Corporation. All rights reserved.

Inspecting system...


===============================================================================
                         Server Configuration
===============================================================================

1) Domain/Workgroup:                    Domain:  <domain.local>
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

## HP 3PAR and MSA MPIO & DSM installation

```mpclaim -r -i -a "HP MSA2" "HP HSV300" "3PARdataVV"```

## Add user to local Administrators group

```PS C:\> Add-LocalGroupMember -Group "Administrators" -Member "user_name"```

## NIC Teaming (LACP) configuration

```PS C:\> New-NetLbfoTeam -Name "LACP" -TeamMembers "Embedded FlexibleLOM 1 Port 3","Embedded FlexibleLOM 1 Port 4"```
