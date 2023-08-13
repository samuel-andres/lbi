# Managing firewall rules on Windows through PowerShell

## Add new rule:
```powershell
New-NetFireWallRule `
    -Name "my-{featureName}-{portNumber}-{IbOrOb}-rule" `
    -DisplayName "{featureName} ({portNumber}) ({InboundOrOutbound})" `
    -Description "Rule for allowing {inboundOrOutbound} traffic over port {portNumber}. Mainly used for {featureDescription}" `
    -Direction Inbound `
    -LocalPort <portNumber> `
    -Action Allow `
    -Protocol TCP
```

## Remove existing rule:
```powershell
Remove-NetFirewallRule -Name <ruleName>
```

## List all your created rules:
```powershell
Get-NetFirewallRule | grep my-*
```

## Samples:

### Django server:
```powershell
New-NetFireWallRule `
    -Name "my-django-sv-8000-ib-rule" `
    -DisplayName "Django Server (8000) (Inbound)" `
    -Description "Rule for allowing inbound traffic over port 8000. Mainly used for django development servers" `
    -Direction Inbound `
    -LocalPort 8000 `
    -Action Allow `
    -Protocol TCP
```

### Angular server:
```powershell
New-NetFireWallRule `
    -Name "my-ng-sv-4200-ib-rule" `
    -DisplayName "Angular Server (4200) (Inbound)" `
    -Description "Rule for allowing inbound traffic over port 4200. Mainly used for angular development servers" `
    -Direction Inbound `
    -LocalPort 4200 `
    -Action Allow `
    -Protocol TCP
```

### Expo server:
```powershell
New-NetFireWallRule `
    -Name "my-expo-sv-19000-ib-rule" `
    -DisplayName "Expo Server (19000) (Inbound)" `
    -Description "Rule for allowing inbound traffic over port 19000. Mainly used for expo development servers" `
    -Direction Inbound `
    -LocalPort 19000 `
    -Action Allow `
    -Protocol TCP
```
```powershell
New-NetFireWallRule `
    -Name "my-expo-dt-19001-ib-rule" `
    -DisplayName "Expo DevTools (19001) (Inbound)" `
    -Description "Rule for allowing inbound traffic over port 19001. Mainly used for expo devtools" `
    -Direction Inbound `
    -LocalPort 19001 `
    -Action Allow `
    -Protocol TCP
```
```powershell
New-NetFireWallRule `
    -Name "my-expo-mb-19002-ib-rule" `
    -DisplayName "Expo MetroBundler (19002) (Inbound)" `
    -Description "Rule for allowing inbound traffic over port 19002. Mainly used for expo metro bundler" `
    -Direction Inbound `
    -LocalPort 19002 `
    -Action Allow `
    -Protocol TCP
```
---
```powershell
New-NetFireWallRule `
    -Name "my-expo-sv-19000-ob-rule" `
    -DisplayName "Expo Server (19000) (Outbound)" `
    -Description "Rule for allowing outbound traffic over port 19000. Mainly used for expo development servers" `
    -Direction Outbound `
    -LocalPort 19000 `
    -Action Allow `
    -Protocol TCP
```
```powershell
New-NetFireWallRule `
    -Name "my-expo-dt-19001-ob-rule" `
    -DisplayName "Expo DevTools (19001) (Outbound)" `
    -Description "Rule for allowing outbound traffic over port 19001. Mainly used for expo devtools" `
    -Direction Outbound `
    -LocalPort 19001 `
    -Action Allow `
    -Protocol TCP
```
```powershell
New-NetFireWallRule `
    -Name "my-expo-mb-19002-ob-rule" `
    -DisplayName "Expo MetroBundler (19002) (Outbound)" `
    -Description "Rule for allowing outbound traffic over port 19002. Mainly used for expo metro bundler" `
    -Direction Outbound `
    -LocalPort 19002 `
    -Action Allow `
    -Protocol TCP
```
