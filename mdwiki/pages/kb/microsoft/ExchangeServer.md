# Exchange Server

## Verificar o log de mensagens recebidas por um usuário específico

```Get-TransportService | Get-MessageTrackingLog -ResultSize Unlimited -Start "06/30/2019 23:59:00" -End "07/30/2019 17:00:00" -Recipients $email | Select-Object | ft timestamp,eventid,source,messagesubject```

## Mover um usuário específico de database

```New-MoveRequest -Identity $email -TargetDatabase DEFAULT -BadItemLimit 100```

## Verificar o status de uma movimentação de database

```Get-MoveRequestStatistics -Identity $email```

## Confirmar que a movimentação de database ocorreu conforme esperado

```Get-Mailbox -Identity $email | fl Database```

## Habilitar auditoria da mailbox em um usuário específico

```Set-Mailbox -Identity $email -AuditAdmin Update,Copy,Move,MoveToDeletedItems,SoftDelete,HardDelete,FolderBind,SendAs,SendOnBehalf,MessageBind```

```Set-Mailbox -Identity $email -AuditDelegate Update,Move,MoveToDeletedItems,SoftDelete,HardDelete,FolderBind,SendAs,SendOnBehalf```

```Set-Mailbox -Identity $email -AuditOwner Update,Move,MoveToDeletedItems,SoftDelete,HardDelete```

```Set-Mailbox -Identity $email -AuditEnabled $true```

```Set-Mailbox -Identity $email -AuditLogAgeLimit 10```

## Desabilitar a mailbox de um usuário específico

```Disable-Mailbox -Identity $email```
