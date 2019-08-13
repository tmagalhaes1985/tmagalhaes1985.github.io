# Office 365

## Sobre o Office 365

O Office 365 é um serviço de assinatura na nuvem que reúne as melhores ferramentas para as pessoas trabalharem. Combinando os melhores aplicativos de produtividade, como o Excel e o Outlook, com eficientes serviços na nuvem, como o OneDrive e o Microsoft Teams, o Office 365 permite criar e compartilhar em qualquer lugar e em qualquer dispositivo.

## Remover licenciamento do Office 365 pelo Admin Portal

1. Conectar ao Azure AD

    ```Connect-AzureAD```

2. Conectar ao Microsoft Online

    ```Connect-MsolService```

3. Remover licenças

    ```Set-MsolUserLicense -UserPrincipalName $email -RemoveLicenses "timpes:OFFICESUBSCRIPTION"```
