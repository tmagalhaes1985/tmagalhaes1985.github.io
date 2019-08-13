# Exchange Server

## Sobre o Exchange Server

## Verificar histórico de mensagens recebidas em uma caixa de correio

```Get-TransportService | Get-MessageTrackingLog -ResultSize Unlimited -Start "06/30/2008 23:59:00" -End "07/30/2019 17:00:00" -Recipients <email> | Select-Object | ft timestamp,eventid,source,messagesubject```

## Mover um usuário específico de database

```New-MoveRequest -Identity <email> -TargetDatabase <DatabaseName> -BadItemLimit 100```

## Verificar o status de uma movimentação de database

```Get-MoveRequestStatistics -Identity <email>```

## Confirmar que a movimentação de database ocorreu conforme esperado

```Get-Mailbox -Identity <email> | fl Database```

## Habilitar auditoria em uma caixa de correio

```Set-Mailbox -Identity <email> -AuditAdmin Update,Copy,Move,MoveToDeletedItems,SoftDelete,HardDelete,FolderBind,SendAs,SendOnBehalf,MessageBind```

```Set-Mailbox -Identity <email> -AuditDelegate Update,Move,MoveToDeletedItems,SoftDelete,HardDelete,FolderBind,SendAs,SendOnBehalf```

```Set-Mailbox -Identity <email> -AuditOwner Update,Move,MoveToDeletedItems,SoftDelete,HardDelete```

```Set-Mailbox -Identity <email> -AuditEnabled $true```

```Set-Mailbox -Identity <email> -AuditLogAgeLimit 10```

## Desabilitar uma caixa de correio

```Disable-Mailbox -Identity <email>```
