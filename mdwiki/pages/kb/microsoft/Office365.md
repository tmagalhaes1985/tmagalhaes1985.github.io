# Office 365

## Sobre o Office 365

O Office 365 é um serviço de assinatura na nuvem que reúne ferramentas de trabalho, como o Excel e o Outlook, com serviços na nuvem, como o OneDrive e o Microsoft Teams.

## Remover licenciamento do Office 365 pelo Admin Portal

1. Conecte ao Azure AD

    ```Connect-AzureAD```

2. Conecte ao Microsoft Online

    ```Connect-MsolService```

3. Remova a licença do Office 365

    ```Set-MsolUserLicense -UserPrincipalName $email -RemoveLicenses "<domain>:OFFICESUBSCRIPTION"```
