# Active Directory

## Sobre o Active Directory

O AD implementa um serviço de diretório LDAP que armazena informações sobre objetos em redes de computadores.

A exemplo do NIS, surgiu da necessidade de se ter um único diretório corporativo para usuários acessarem múltiplos sistemas de rede com a centralização de senhas fornecida pelo AD.

Nascido com o Windows 2000 Server, o AD armazena objetos como usuários, grupos, membros dos grupos, senhas, contas de computadores, relações de confiança, informações sobre o domínio, unidades organizacionais, etc.

Além de armazenar estes objetos em seu banco de dados, o AD disponibiliza também serviços, como: autenticação dos usuários, replicação do seu banco de dados, pesquisa dos objetos disponíveis na rede, administração centralizada da segurança utilizando GPO, entre outros serviços. Esses recursos tornam a administração de uma rede bem mais fácil, sendo possível administrar todos os recursos disponíveis de maneira centralizada.

## Habilitar uma conta do usuário

```Enable-ADAccount -Identity <userName>```

## Desabilitar uma conta do usuário

```Disable-ADAccount -Identity <userName>```

## Mover uma conta de usuário desabilitada para outra OU

```Move-ADObject -Identity <userDn> -TargetPath "OU=DisabledUsers,DC=CONTOSO,DC=local"```

## Listar todos os usuários pertencentes a um grupo do domínio

```Get-ADGroupMember -Identity <securityGroup> | ft name,SamAccountName -AutoSize | clip```

## Remover todos os grupos do domínio de um usuário

```Get-ADUser <userName> -Properties MemberOf | Select -Expand MemberOf | %{Remove-ADGroupMember $_ -member <userName>}```

## Verificar a última alteração de senha

```Get-ADuser -Filter * -Properties passwordlastset, passwordneverexpires | sort Name | ft Name, passwordlastset, passwordneverexpires```

## Migração das funções de Mestres de Operações

### PDC Emulator

```Move-ADDirectoryServerOperationMasterRole -Identity <TargetDC> -OperationMasterRole pdcemulator```

### RID Master

```Move-ADDirectoryServerOperationMasterRole -Identity <TargetDC> -OperationMasterRole ridmaster```

### Infrastructure Master

```Move-ADDirectoryServerOperationMasterRole -Identity <TargetDC> -OperationMasterRole infrastructuremaster```

### Schema Master

```Move-ADDirectoryServerOperationMasterRole -Identity <TargetDC> -OperationMasterRole schemamaster```

### Domain Naming Master

```Move-ADDirectoryServerOperationMasterRole -Identity <TargetDC> -OperationMasterRole domainnamingmaster```
