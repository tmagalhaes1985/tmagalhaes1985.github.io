# Microsoft Knowledge Base

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

Note! Para validar chave do Windows Server imediatamente, execute o comando a seguir:

```powershell
slmgr /ato
```

## Internet Information Services

### Configuração do IIS como proxy reverso

As seguintes configurações são essenciais para o correto funcionamento do IIS como proxy reverso.

#### Software necessário

1. Instalar a função do IIS no servidor
2. Instalar o [URL Rewrite](http://www.iis.net/expand/URLRewrite)
3. Instalar o [Application Routing Request](http://www.iis.net/expand/ApplicationRequestRouting)

[Referência](blogs.msdn.microsoft.com/carlosag/2010/04/01/setting-up-a-reverse-proxy-using-iis-url-rewrite-and-arr/)

### Habilitar redirecionamento HTTPS

```html
            <rules>
                <clear />
                <rule name="HTTPS Enabled" enabled="true" stopProcessing="true">
                    <match url="(.*)" ignoreCase="false" />
                    <conditions logicalGrouping="MatchAll" trackAllCaptures="false">
                        <add input="{HTTPS}" pattern="off" />
                    </conditions>
                    <action type="Redirect" url="https://{HTTP_HOST}/{R:1}" appendQueryString="true" redirectType="Permanent" />
                </rule>
```

## Monitoramento

### Instalação do agente do Zabbix em máquinas Windows

Para instalar o serviço de monitoramento do Zabbix em máquinas Windows, basta executar a linha abaixo (considerando que você instalou os binários do Zabbix no diretório C:\Zabbix):

```powershell
PS C:\Zabbix\4.2\bin\zabbix_agentd.exe --config C:\Zabbix\4.2\conf\zabbix_agentd.win.conf --install
```

## PowerShell

### Converter certificados .PFX para .DER

```powershell
Get-PfxCertificate -FilePath C:\TEMP\Wildcard.pfx | Export-Certificate -FilePath C:\TEMP\Wildcard.der -Type CERT
```

### Conectar em outro computador remotamente via PowerShell

```powershell
Enter-PSSession -ComputerName <Hostname ou IP>
```

### Network Policy Server

#### Exportar e importar a configuração do NPS usando o Windows PowerShell

1. Para exportar a configuração do servidor NPS:

    ```powershell
    Export-NpsConfiguration -Path C:\TEMP\NpsConfig.xml
    ```

2. Para importar a configuração do servidor NPS:

    ```powershell
    Import-NpsConfiguration -Path C:\TEMP\NpsConfig.xml
    ```

### Exchange Server

Note! Configure a variável ```$email``` antes de executar quaisquer comandos abaixo.

#### Verificar o log de mensagens recebidas por um usuário específico

```powershell
Get-TransportService | Get-MessageTrackingLog -ResultSize Unlimited -Start "06/30/2019 23:59:00" -End "07/30/2019 17:00:00" -Recipients $email | Select-Object | ft timestamp,eventid,source,messagesubject
```

#### Mover um usuário específico de database

```powershell
New-MoveRequest -Identity $email -TargetDatabase DEFAULT -BadItemLimit 100
```

#### Verificar o status de uma movimentação de database

```powershell
Get-MoveRequestStatistics -Identity $email
```

#### Confirmar que a movimentação de database ocorreu conforme esperado

```powershell
Get-Mailbox -identity $email | fl database
```

#### Habilitar auditoria da mailbox em um usuário específico

```powershell
Set-Mailbox -Identity $email -AuditAdmin Update,Copy,Move,MoveToDeletedItems,SoftDelete,HardDelete,FolderBind,SendAs,SendOnBehalf,MessageBind
Set-Mailbox -Identity $email -AuditDelegate Update,Move,MoveToDeletedItems,SoftDelete,HardDelete,FolderBind,SendAs,SendOnBehalf
Set-Mailbox -Identity $email -AuditOwner Update,Move,MoveToDeletedItems,SoftDelete,HardDelete
Set-Mailbox -Identity $email -AuditEnabled $true
Set-Mailbox -Identity $email -AuditLogAgeLimit 10
```

#### Desabilitar a mailbox de um usuário específico

```powershell
Disable-Mailbox -Identity $email
```

### Office 365

#### Remove Office 365 Licensing from Admin Portal

1. Connect to server Beppu.mpes.gov.br first and then open a PowerShell console
2. Set the variable ```$credential``` before running the scripts
3. Also set the variable ```$email``` to ensure the correct script execution
4. Connect to Azure AD

    ```powershell
    Connect-AzureAD -Credential $credential
    ```

5. Connect to Microsoft Online

    ```powershell
    Connect-MsolService -Credential $credential
    ```

6. Remove Microsoft Office licenses

    ```powershell
    Set-MsolUserLicense -UserPrincipalName $email -RemoveLicenses "timpes:OFFICESUBSCRIPTION"
    ```

### Active Directory

1. Connect to server Hadano.mpes.gov.br first and then open a PowerShell console
2. Set the variable ```$userName``` before running the scripts
3. Also set the variable ```$userDn``` to ensure the correct script execution

#### Remove all domain groups

```powershell
Get-ADUser $userName -Properties MemberOf | Select -Expand MemberOf | %{Remove-ADGroupMember $_ -member $userName}
```

#### Disable User Account

```powershell
Disable-ADAccount -Identity $userName
```

#### Move disabled users to Users_OFF OU

1. Get the distinguished name of the object that you want to move

    ```powershell
    Get-ADUser $userName | fl Name,DistinguishedName
    ```

2. Move the user

    ```powershell
    Move-ADObject -Identity $userDn -TargetPath "OU=Users_OFF,DC=mpes,DC=gov,DC=br"
    ```

### Skype for Business

#### Desabilitar conta do Skype for Business

```powershell
Disable-CsUser -Identity $email
```

### Hyper-V

#### Configuração do Hyper-V em ambientes Server Core

1. Instalação das features do Hyper-V

    ```powershell
    Install-WindowsFeature -name MultiPath-io,Hyper-V,Data-Center-Bridging,Failover-Clustering
    ```

2. Configuração do MultiPath I/O para storages HP 3PAR e EVA

    ```powershell
    PS C:\Windows\system32\mpclaim -r -I -d "3PARdataVV" "HP HSV340"
    ```

### Reconfiguração do repositório PSGallery

1. Registre-o como repositório padrão

    ```powershell
    Register-PSRepository -Default
    ```

2. Altere a política de instalação e o gerenciador de pacotes para permitir o download dos módulos via NuGet

    ```powershell
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -PackageManagementProvider NuGet
    ```

3. Instale o gerenciador de pacotes NuGet (o gerenciador de pacotes Chocolatey é opcional)

    ```powershell
    Install-Module -Name NuGet
    ```

4. (Opcional): Instale o gerenciador de pacotes Chocolatey

    ```powershell
    Install-Module -Name ChocolateyGet
    ```

### Azure

#### Instalação dos cmdlets do PowerShell para gerenciamento do Azure

```powershell
Install-Module -Name Azure -AllowClobber -Force
Install-Module -Name AzureAD, AzureRM -AllowClobber -Force
```

### SQL Server

#### Error message when you open SQL Server Configuration Manager in SQL Server: "Cannot connect to WMI provider. You do not have permission or the server is unreachable"

1. Para solucionar este problema, basta executar o comando a seguir no servidor que apresentou a mensagem de erro (substitua <SQL Server number> de acordo com a sua versão instalada do SQL Server, conforme segue a tabela abaixo):

    ```powershell
    mofcomp "%programfiles(x86)%\Microsoft SQL Server\<SQL Server number>\Shared\sqlmgmproviderxpsp2up.mof"
    ```

    Note! Para este comando ser executado corretamente, é necessário que o arquivo ```Sqlmgmproviderxpsp2up.mof``` esteja presente no diretório ```%programfiles(x86)%\Microsoft SQL Server\<SQL Server number>\Shared```.

    SQL Server version            | SQL Server number
    ------------------------------|------------------
    Microsoft SQL Server 2019     | 150
    Microsoft SQL Server 2017     | 140
    Microsoft SQL Server 2016     | 130
    Microsoft SQL Server 2014     | 120
    Microsoft SQL Server 2012     | 110
    Microsoft SQL Server 2008 R2  | 100
    Microsoft SQL Server 2008     | 100
    Microsoft SQL Server 2005     | 90

2. Após executar a ferramenta Mofcomp, reinicie o serviço ```Windows Management Instrumentation``` para que a alteração tenha efeito.

### Cheat Sheet PowerShell para administradores Linux

Shell on Linux                                | Powershell on Windows
----------------------------------------------|----------------------
```cat```                                     | ```cat```
```cd```                                      | ```cd```
```date```                                    | ```Get-Date```
```df -hi```                                  | ```Get-PSDrive```
```env```                                     | ```Get-ChildItem Env:```
```... | grep```                              | ```... | findstr```
```history```                                 | ```history```
```ip address show```                         | ```ipconfig```
```ls```                                      | ```ls``` or ```Get-Children```
```nslookup```                                | ```nslookup``` or ```Resolve-DnsName```
```ping```                                    | ```ping```
```ps```                                      | ```Get-Process```
```ss```                                      | ```netstat```
```ssh```                                     | ```Enter-PSSession```
```systemctl start service```                 | ```Start-Service service```
```systemctl stop service```                  | ```Stop-Service service```
```... | tail -n 5```                         | ```... | Select-Object -Last 5```
```top```                                     | ```While(1) {ps | sort -des cpu | select -f 15 | ft -a; sleep 2; cls}```
```tree```                                    | ```tree```
```vi```, ```vim``` or ```gedit```            | ```notepad```
