# Office 365

## Sobre o [Office 365](https://office365.com/)

O Office 365 é um serviço de assinatura na nuvem que reúne as melhores ferramentas para as pessoas trabalharem. Combinando os melhores aplicativos de produtividade, como o Excel e o Outlook, com eficientes serviços na nuvem, como o OneDrive e o Microsoft Teams, o Office 365 permite criar e compartilhar em qualquer lugar e em qualquer dispositivo.

## Remove Office 365 Licensing from Admin Portal

1. Connect to Azure AD

    ```Connect-AzureAD```

2. Connect to Microsoft Online

    ```Connect-MsolService```

3. Remove Microsoft Office licenses

    ```Set-MsolUserLicense -UserPrincipalName $email -RemoveLicenses "timpes:OFFICESUBSCRIPTION"```
