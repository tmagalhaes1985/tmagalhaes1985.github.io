# Group Policy

## Resetar todas as GPOs aplicadas a um computador para o padrão

1. ```secedit /configure /cfg C:\Windows\inf\defltbase.inf /db defltbase.sdb /verbose```
2. ```RD /S /Q "C:\Windows\System32\GroupPolicyUsers"```
3. ```RD /S /Q "C:\Windows\System32\GroupPolicy"```
