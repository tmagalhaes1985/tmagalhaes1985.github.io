# Active Directory

1. Set the variable ```$userName``` before running the scripts

## Remove all domain groups

```powershell
Get-ADUser $userName -Properties MemberOf | Select -Expand MemberOf | %{Remove-ADGroupMember $_ -member $userName}
```

## Disable User Account

```powershell
Disable-ADAccount -Identity $userName
```

## Move disabled users to DisabledUsers OU

1. Get the distinguished name of the object that you want to move

    ```powershell
    Get-ADUser $userName | fl Name,DistinguishedName
    ```

2. Move the user

    ```powershell
    Move-ADObject -Identity $userDn -TargetPath "OU=DisabledUsers,DC=CONTOSO,DC=local"
    ```
