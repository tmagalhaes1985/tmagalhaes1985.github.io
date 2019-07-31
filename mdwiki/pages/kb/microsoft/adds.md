# Active Directory

1. Set the variable ```$userName``` before running the scripts

## Remove all domain groups

```Get-ADUser $userName -Properties MemberOf | Select -Expand MemberOf | %{Remove-ADGroupMember $_ -member $userName}```

## Disable User Account

```Disable-ADAccount -Identity $userName```

## Move disabled users to DisabledUsers OU

1. Get the distinguished name of the object that you want to move

    ```Get-ADUser $userName | fl Name,DistinguishedName```

2. Move the user

    ```Move-ADObject -Identity $userDn -TargetPath "OU=DisabledUsers,DC=CONTOSO,DC=local"```
