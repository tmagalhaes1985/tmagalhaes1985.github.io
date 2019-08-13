# Group Policy

## Sobre as Políticas de Grupo

## Resetar todas as GPOs aplicadas a um computador para o padrão

Abra um prompt de comando e execute os seguintes comandos na sequência:

```secedit /configure /cfg C:\Windows\inf\defltbase.inf /db defltbase.sdb /verbose```

```RD /S /Q "C:\Windows\System32\GroupPolicyUsers"```

```RD /S /Q "C:\Windows\System32\GroupPolicy"```

## Resetar a Default Domain Policy para o padrão

```dcgpofix /ignoreschema /target:Domain```
