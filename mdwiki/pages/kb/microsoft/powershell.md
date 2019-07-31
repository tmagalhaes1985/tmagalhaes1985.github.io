# PowerShell

## Converter certificados .PFX para .DER

```
Get-PfxCertificate -FilePath C:\TEMP\Wildcard.pfx | Export-Certificate -FilePath C:\TEMP\Wildcard.der -Type CERT
```

## Conectar em um computador remotamente via PowerShell

```
Enter-PSSession -ComputerName <Hostname ou IP>
```

## (Re)configuração do repositório PSGallery

1. Registre-o como repositório padrão

    ```
    Register-PSRepository -Default
    ```

2. Altere a política de instalação e o gerenciador de pacotes para permitir o download dos módulos via NuGet

    ```
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -PackageManagementProvider NuGet
    ```

3. Instale o gerenciador de pacotes NuGet (o gerenciador de pacotes Chocolatey é opcional)

    ```
    Install-Module -Name NuGet
    ```

4. (Opcional): Instale o gerenciador de pacotes Chocolatey

    ```
    Install-Module -Name ChocolateyGet
    ```

## Instalação dos cmdlets do PowerShell para gerenciamento do Azure

```
Install-Module -Name Azure -AllowClobber -Force
Install-Module -Name AzureAD, AzureRM -AllowClobber -Force
```

## Cheat Sheet PowerShell para administradores Linux

Shell                      | PowerShell
---------------------------|----------------------
cat                        | cat
cd                         | cd
date                       | ```Get-Date```
df -hi                     | ```Get-PSDrive```
env                        | ```Get-ChildItem Env:```
grep                       | findstr
history                    | history
ip address show            | ipconfig
ls                         | ls or ```Get-Children```
nslookup                   | nslookup or ```Resolve-DnsName```
ping                       | ping
ps                         | ```Get-Process```
ss                         | netstat
ssh                        | ```Enter-PSSession```
systemctl start service    | ```Start-Service service```
systemctl stop service     | ```Stop-Service service```
tail -n 5                  | ```Select-Object -Last 5```
tree                       | tree
vi vim or gedit            | notepad

O comando ```top``` do Linux é o ponto fora da curva, pois não há nenhuma equivalência direta a ele. Para ter o mesmo tipo de saída em PowerShell, execute o comando a seguir:

```While(1) {ps | sort -des cpu | select -f 15 | ft -a; sleep 2; cls}```
