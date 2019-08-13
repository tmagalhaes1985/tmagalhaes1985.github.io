# PowerShell

## Sobre o PowerShell

## Exibir o último usuário que logou em um servidor ou estação de trabalho

```(Get-WmiObject -Class win32_process -ComputerName $computer | Where-Object name -Match explorer).getowner().user```

## Converter certificados .PFX para .DER

```Get-PfxCertificate -FilePath C:\TEMP\Wildcard.pfx | Export-Certificate -FilePath C:\TEMP\Wildcard.der -Type CERT```

## Conectar em um computador remotamente via PowerShell

```Enter-PSSession -ComputerName <Hostname ou IP>```

## Reconfigurar o repositório PSGallery

```Register-PSRepository -Default```

```Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -PackageManagementProvider NuGet```

```Install-Module -Name NuGet, ChocolateyGet```

## Instalar dos cmdlets do PowerShell para gerenciamento da Nuvem Microsoft

```Install-Module -Name Azure, AzureAD, AzureRM -AllowClobber -Force```

## PowerShell para administradores Linux

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
