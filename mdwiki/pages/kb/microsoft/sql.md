# SQL Server

## Error message when you open SQL Server Configuration Manager in SQL Server: "Cannot connect to WMI provider. You do not have permission or the server is unreachable"

1. Para solucionar este problema, basta executar o comando a seguir no servidor que apresentou a mensagem de erro:

    ```powershell
    mofcomp "%programfiles(x86)%\Microsoft SQL Server\<SQL Server number>\Shared\sqlmgmproviderxpsp2up.mof"
    ```

    Note! Substitua ```SQL Server number``` de acordo com a sua versão instalada do SQL Server, conforme segue a tabela abaixo

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
