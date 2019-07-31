# Internet Information Services

## Configuração como proxy reverso

As seguintes configurações são essenciais para o correto funcionamento do IIS como proxy reverso.

1. IIS
2. [URL Rewrite](http://www.iis.net/expand/URLRewrite)
3. [Application Routing Request](http://www.iis.net/expand/ApplicationRequestRouting)

[Referência](blogs.msdn.microsoft.com/carlosag/2010/04/01/setting-up-a-reverse-proxy-using-iis-url-rewrite-and-arr/)

## Habilitar redirecionamento HTTPS

```
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
