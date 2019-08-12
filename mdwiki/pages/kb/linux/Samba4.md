# [Samba 4](https://www.samba.org/)

## Sobre o Samba 4

O Samba é um conjunto Software que fornece serviços de arquivo e impressão para clientes SMB/CIFS, incluindo sistemas operacionais Microsoft Windows. O Samba está disponível gratuitamente sob a Licença Pública Geral GNU.

O Samba é um componente importante para integrar servidores e desktops Linux/Unix em ambientes do Active Directory. Pode funcionar como um controlador de domínio ou como um servidor membro do domínio.

## Implantação do Samba 4 como controlador de domínio

**OBS**: Se você estiver instalando o Samba em um ambiente de produção, é recomendável executar dois ou mais DCs por motivos de failover.

O Samba como DC suporta:

- Servidor LDAP integrado como back end do AD
- Centro de distribuição de chaves Heimdal Kerberos (KDC)

### Planejamento da implantação

1. Selecione um nome de host para seu AD DC. Não use termos NT4 como nome do host (como PDC ou BDC). Esses modos não existem no Active Directory e podem causar confusão.
2. Selecione um domínio DNS para sua floresta do AD. O nome também será usado como o domínio Kerberos do AD. Este domínio DNS não poderá ser alterado posteriormente. Não use domínios DNS com TLD .local, pois este TLD é usado pelo daemon do Avahi.
3. Defina um endereço IP estático no DC.
4. Desabilite ferramentas que atualizem automaticamente seu /etc/resolv.conf. DCs e membros do domínio devem apontar para servidor DNS capazes de resolver as zonas DNS do AD.

### Instalação do Samba 4

1. Configure o repositório EPEL

    RHEL/CentOS 6:

    ```yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm```

    RHEL/CentOS7:

    ```yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm```

    ```subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"  --enable "rhel-ha-for-rhel-*-server-rpms"```

2. Instale os pré-requisitos

    ```
    yum -y install attr bind-utils docbook-style-xsl gcc gdb krb5-workstation \
        libsemanage-python libxslt perl perl-ExtUtils-MakeMaker \
        perl-Parse-Yapp perl-Test-Base pkgconfig policycoreutils-python \
        python2-crypto gnutls-devel libattr-devel keyutils-libs-devel \
        libacl-devel libaio-devel libblkid-devel libxml2-devel openldap-devel \
        pam-devel popt-devel python-devel readline-devel zlib-devel systemd-devel \
        lmdb-devel jansson-devel gpgme-devel pygpgme libarchive-devel
    ```

3. Instale o Samba 4

    ```yum -y install samba```

4. Provisione o domínio do AD

    ```samba-tool domain provision --server-role=dc --use-rfc2307 --dns-backend=SAMBA_INTERNAL --realm=seudominio.corp --domain=SEUDOMINIO --adminpass=Passw0rd```

    **OBS**: Substitua ```seudominio.corp``` pelo nome DNS do seu domíno e ```SEUDOMINIO``` pelo nome NETBIOS (sem TLD)

5. Configure o arquivo /etc/resolv.conf

    ```
    search seudominio.corp # substituir pelo nome DNS do seu dominio
    nameserver 192.168.0.10 # substituir pelo IP do seu servidor Samba 4 AD
    ```

6. Crie uma zona DNS de pesquisa reversa

    ```samba-tool dns zonecreate 192.168.0.10 0.168.192.in-addr.arpa```

    **OBS**: Novamente, substitua o IP 192.168.0.10 pelo IP do seu Samba 4 AD, e 0.168.192.in-addr.arpa pela faixa de rede utilizada na sua infraestrutura.

7. Inicialize seu controlador de domínio Samba 4

    ```samba```

8. Configure a sincronização de hora com uma fonte externa

    Instale o chrony:

    ```yum -y install chrony```

    ```
    echo "keyfile /etc/chrony/chrony.keys
    driftfile /var/lib/chrony/chrony.drift
    logdir /var/log/chrony
    maxupdateskew 100.0
    hwclockfile /etc/adjtime
    rtcsync
    makestep 1 3
    bindcmdaddress 192.168.0.10 # IP do Samba 4 AD
    server br.pool.ntp.org     iburst
    allow 192.168.0.0/24 # dns netmask
    ntpsigndsocket  /usr/local/samba/var/lib/ntp_signd" > /etc/chrony/chrony.conf
    ```

    Configure o chrony para inicializar junto do sistema e (re)inicie o serviço:

    ```systemctl enable chronyd && systemctl restart chronyd```

### Validando a implantação

1. Verifique a existência dos compartilhamentos ```netlogon``` e ```sysvol```

    Liste os compartilhamentos utilizando o comando:

    ```smbclient -L localhost -U%```

    Verifique a autenticação conectando ao compartilhamento netlogon com a conta de Administrador do domínio:

    ```smbclient //localhost/netlogon -U Administrator -c 'ls'```

2. Verifique a resolução de nomes DNS

    ```host -t SRV _ldap._tcp.seudominio.corp.```

    ```host -t SRV _kerberos._tcp.seudominio.corp.```

    ```host -t A Samba4DC1.seudominio.corp.```

    **OBS**: Substitua seudominio.corp pelo nome DNS do seu domínio e Samba4DC1 pelo hostname do seu servidor Samba 4 AD.

3. Verifique o funcionamento do Kerberos

    Solicite um ticket Kerberos para a conta de Administrador do domínio:

    ```kinit administrator```

    Liste os tickets em cache:

    ```klist```

## Implantação do Samba 4 como membro do domínio

Um membro do domínio Samba é uma máquina Linux associada a um domínio que executa o Samba e não fornece serviços de domínio, como um controlador de domínio primário (PDC) NT4 ou controlador de domínio (DC) do Active Directory (AD).

Em um membro do domínio Samba, você pode:

- Use usuários e grupos de domínio em ACLs locais em arquivos e diretórios.
- Configure compartilhamentos para atuar como um servidor de arquivos.
- Configure os serviços de impressão para atuar como um servidor de impressão.
- Configure o PAM para permitir que os usuários do domínio façam logon localmente ou se autentiquem nos serviços locais instalados.

### Passo a passo

1. Configure o /etc/resolv.conf
2. Valide a resolução de nomes
3. Configure a sincronização de tempo
4. Instale o Samba 4

    ```yum -y install samba```

5. Adicione o servidor ao domínio

    ```net ads join -U administrator```

## Implantação do Samba 4 como servidor de arquivos

**OBS1**: O Samba 4 já deve estar instalado para que os demais passos abaixo possam ser seguidos.

**OBS2**: Após realizar a configuração do servidor, as pemissões podem ser dadas através do MMC de Gerenciamento do Computador através de uma estação de trabalho Windows.

### Passo a passo

1. Para conceder o privilégio ao grupo Admins. Do Domínio, insira:

    ```net rpc rights grant "SEUDOMINIO\Domain Admins" SeDiskOperatorPrivilege -U "SEUDOMINIO\administrator"```

2. Adicione um compartilhamento

    ```sudo mkdir -p /srv/samba/FileServer/```
    ```chown root:"Domain Admins" /srv/samba/FileServer/```
    ```chmod 0770 /srv/samba/FileServer/```

3. Adicione o compartilhamento [FileServr] ao seu arquivo smb.conf:

    ```
    [FileServer]
        path = /srv/samba/FileServer/
        read only = no
    ```

4. Recarregue as configurações do Samba 4

    ```smbcontrol all reload-config```

## Implantação do Samba 4 como servidor de impressão

**OBS1**: O Samba 4 já deve estar instalado para que os demais passos abaixo possam ser seguidos.

**OBS2**: Após realizar a configuração do servidor, as pemissões podem ser dadas através do MMC de Gerenciamento de Impressoras através de uma estação de trabalho Windows.

1. Instale o CUPS

    ```yum -y install cups```

2. Crie os diretórios necessários

    ```mkdir -p /var/spool/samba/```

    ```chmod 1777 /var/spool/samba/```

    ```mkdir -p /srv/samba/printer_drivers/```

    ```chgrp -R "SAMDOM\Domain Admins" /srv/samba/printer_drivers/```
    
    ```chmod -R 2775 /srv/samba/printer_drivers/```

    ```chmod 755 /usr/local/bin/Pdfprint.sh```

1. Habilite o serviço ```spoolssd``` editando a sessão [global] no arquivo smb.conf:

    ```
    rpc_server:spoolss = external
    rpc_daemon:spoolssd = fork
    spoolss: architecture = Windows x64
    printing = CUPS
    ```

2. Edite a sessão [printers] no seu arquivo smb.conf:

    ```
    [printers]
        path = /var/spool/samba/
        printable = yes
    ```

3. Edite a sessão [PDFprinter] no seu arquivo smb.conf

    ```
    [PDFprinter]
            comment = Samba Virtual PDF Printer
            path = /var/spool/samba
            printable = Yes
            lpq command =
            lprm command =
            print command = /usr/local/bin/Pdfprint.sh -s /var/spool/samba/%s -d /home/%U -o %U -m 600
    ```

4. Edite a sessão [print$] no seu arquivo smb.conf

    ```
    [print$]
        path = /srv/samba/printer_drivers/
        read only = no
    ```

5. Para conceder o privilégio ao grupo Admins. Do Domínio, insira:
   
   ```net rpc rights grant "SEUDOMINIO\Domain Admins" SePrintOperatorPrivilege -U "SEUDOMINIO\administrator"```

6. Recarregue as configurações do Samba 4

    ```smbcontrol all reload-config```

**OBS**: Para adicionar novas impressoras, abra a interface web do CUPS pelo seu navegador. Exemplo: https://SambaPrintSrv:631/admin
