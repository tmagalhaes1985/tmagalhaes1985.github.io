# Active Directory

## Remover todos os grupos de um usuário

```Get-ADUser $userName -Properties MemberOf | Select -Expand MemberOf | %{Remove-ADGroupMember $_ -member $userName}```

## Desabilitar a conta do usuário

```Disable-ADAccount -Identity $userName```

## Mover a conta de usuário desabilitada para outra OU

```Move-ADObject -Identity $userDn -TargetPath "OU=DisabledUsers,DC=CONTOSO,DC=local"```

## Migração das funções de Mestres de Operações

### PDC Emulator

```Move-ADDirectoryServerOperationMasterRole -Identity <TargerDC> -OperationMasterRole pdcemulator```

### RID Master

```Move-ADDirectoryServerOperationMasterRole -Identity <TargerDC> -OperationMasterRole ridmaster```

### Infrastructure Master

```Move-ADDirectoryServerOperationMasterRole -Identity <TargerDC> -OperationMasterRole infrastructuremaster```

### Schema Master

```Move-ADDirectoryServerOperationMasterRole -Identity <TargerDC> -OperationMasterRole schemamaster```

### Domain Naming Master

```Move-ADDirectoryServerOperationMasterRole -Identity <TargerDC> -OperationMasterRole domainnamingmaster```
