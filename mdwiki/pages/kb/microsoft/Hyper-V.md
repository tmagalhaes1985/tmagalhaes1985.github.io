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
