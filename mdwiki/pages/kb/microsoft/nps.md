# Network Policy Server

## Exportar e importar a configuração do NPS usando o Windows PowerShell

1. Para exportar a configuração do servidor NPS:

    ```powershell
    Export-NpsConfiguration -Path C:\TEMP\NpsConfig.xml
    ```

2. Para importar a configuração do servidor NPS:

    ```powershell
    Import-NpsConfiguration -Path C:\TEMP\NpsConfig.xml
    ```
