# System Center Data Protection Manager

## COMO ALTERAR O DPM SQL DATABASE (DPMDB)

Os parâmetros de conexão para o banco de dados de configuração do System Center Data Protection Manager estão localizados na chave do Registro ```HKLM\SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB``` no computador em que o servidor DPM está instalado. Você pode determinar rapidamente parâmetros essenciais executando os seguintes comandos do PowerShell:

### SQL server name

```(Get-ItemProperty 'HKLM:SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB').SqlServer```

### Database name

```(Get-ItemProperty 'HKLM:SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB').DatabaseName```

### SQL server instance

```(Get-ItemProperty 'HKLM:SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB').InstanceName```

Use o SQL Server Management Studio para conectar-se ao banco de dados do DPM usando os valores acima. Se o nome da instância do servidor SQL for ```MSSQLSERVER```, você deve omiti-lo enquanto estiver se conectando ao servidor SQL.

Somente o grupo de administradores locais está autorizado a acessar o DPMDB por padrão. Se você executar o SSMS em um servidor DPM localmente, não se esqueça de executá-lo como administrador.
