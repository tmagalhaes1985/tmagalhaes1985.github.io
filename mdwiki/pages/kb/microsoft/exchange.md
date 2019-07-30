# Exchange Server

Note! Configure a variável ```$email``` antes de executar quaisquer comandos abaixo.

## Verificar o log de mensagens recebidas por um usuário específico

```powershell
Get-TransportService | Get-MessageTrackingLog -ResultSize Unlimited -Start "06/30/2019 23:59:00" -End "07/30/2019 17:00:00" -Recipients $email | Select-Object | ft timestamp,eventid,source,messagesubject
```

## Mover um usuário específico de database

```powershell
New-MoveRequest -Identity $email -TargetDatabase DEFAULT -BadItemLimit 100
```

## Verificar o status de uma movimentação de database

```powershell
Get-MoveRequestStatistics -Identity $email
```

## Confirmar que a movimentação de database ocorreu conforme esperado

```powershell
Get-Mailbox -identity $email | fl database
```

## Habilitar auditoria da mailbox em um usuário específico

```powershell
Set-Mailbox -Identity $email -AuditAdmin Update,Copy,Move,MoveToDeletedItems,SoftDelete,HardDelete,FolderBind,SendAs,SendOnBehalf,MessageBind
Set-Mailbox -Identity $email -AuditDelegate Update,Move,MoveToDeletedItems,SoftDelete,HardDelete,FolderBind,SendAs,SendOnBehalf
Set-Mailbox -Identity $email -AuditOwner Update,Move,MoveToDeletedItems,SoftDelete,HardDelete
Set-Mailbox -Identity $email -AuditEnabled $true
Set-Mailbox -Identity $email -AuditLogAgeLimit 10
```

## Desabilitar a mailbox de um usuário específico

```powershell
Disable-Mailbox -Identity $email
```
