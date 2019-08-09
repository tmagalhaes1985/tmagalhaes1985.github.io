# Network Policy Server

## Sobre o [NPS](https://docs.microsoft.com/pt-br/windows-server/networking/technologies/nps/nps-top)

## Exportar e importar a configuração do NPS usando o Windows PowerShell

1. Para exportar a configuração do servidor NPS:

    ```Export-NpsConfiguration -Path C:\TEMP\NpsConfig.xml```

2. Para importar a configuração do servidor NPS:

    ```Import-NpsConfiguration -Path C:\TEMP\NpsConfig.xml```
