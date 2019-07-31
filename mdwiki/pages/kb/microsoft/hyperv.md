# Hyper-V

## Configuração do Hyper-V em ambientes Server Core

1. Instalação das features do Hyper-V

    ```Install-WindowsFeature -name MultiPath-io,Hyper-V,Data-Center-Bridging,Failover-Clustering```

2. Configuração do MultiPath I/O para storages HP 3PAR e EVA

    ```mpclaim -r -I -d "3PARdataVV" "HP HSV340"```

## Chaves de produto AVMA

As chaves de produto AVMA são utilizadas para ativação de máquinas virtuais.

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

Note! Para validar chave do Windows Server imediatamente, basta executar o comando ```slmgr /ato```.
