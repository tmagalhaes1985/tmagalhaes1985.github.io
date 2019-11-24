# Group Policy

## Reset GPO to domain defaults

Open a command promt and run:

```secedit /configure /cfg C:\Windows\inf\defltbase.inf /db defltbase.sdb /verbose```

```RD /S /Q "C:\Windows\System32\GroupPolicyUsers"```

```RD /S /Q "C:\Windows\System32\GroupPolicy"```

```dcgpofix /ignoreschema /target:Domain```
