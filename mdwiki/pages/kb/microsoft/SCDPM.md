# System Center Data Protection Manager

## HOW TO CHANGE DPM SQL DATABASE (DPMDB)

Connection parameters for System Center Data Protection Manager configuration database are located into registry key HKLM\SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB on the computer where DPM server is installed. You can quickly determine essential parameters by running following PowerShell commands:

SQL server name:

```(Get-ItemProperty 'HKLM:SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB').SqlServer```

Database name:

```(Get-ItemProperty 'HKLM:SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB').DatabaseName```

SQL server instance:

```(Get-ItemProperty 'HKLM:SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB').InstanceName```

Use SQL Server Management Studio to connect to DPM database using values from above. If SQL server instance name is “MSSQLSERVER”, you should omit it while connecting to SQL server.
Only local administrators group is alowed to access DPMDB by default. If you run SSMS on a DPM server locally, don’t forget to run it as administrator.
