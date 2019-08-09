# Internet Information Services

## Sobre o IIS

## Passo a passo para instalar o IIS como proxy reverso

1. Instalar o IIS
2. Instalar o [URL Rewrite](http://www.iis.net/expand/URLRewrite)
3. Instalar o [Application Routing Request](http://www.iis.net/expand/ApplicationRequestRouting)

Configurar de acordo com esse link de [referência.](blogs.msdn.microsoft.com/carlosag/2010/04/01/setting-up-a-reverse-proxy-using-iis-url-rewrite-and-arr/)

## Habilitar redirecionamento HTTPS

Adicione ao arquivo web.config

```            <rules>
                <clear />
                <rule name="HTTPS Enabled" enabled="true" stopProcessing="true">
                    <match url="(.*)" ignoreCase="false" />
                    <conditions logicalGrouping="MatchAll" trackAllCaptures="false">
                        <add input="{HTTPS}" pattern="off" />
                    </conditions>
                    <action type="Redirect" url="https://{HTTP_HOST}/{R:1}" appendQueryString="true" redirectType="Permanent" />
                </rule>
```
