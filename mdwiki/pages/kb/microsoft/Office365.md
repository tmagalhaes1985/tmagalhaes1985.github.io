# Office 365

## Sobre o Office 365

## Remove Office 365 Licensing from Admin Portal

1. Connect to Azure AD

    ```Connect-AzureAD```

2. Connect to Microsoft Online

    ```Connect-MsolService```

3. Remove Microsoft Office licenses

    ```Set-MsolUserLicense -UserPrincipalName $email -RemoveLicenses "timpes:OFFICESUBSCRIPTION"```
