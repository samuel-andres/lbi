# Managing port proxies on Windows through netsh

## Add proxy:
```powershell
netsh interface portproxy add v4tov4 listenport=<port-number> listenaddress=0.0.0.0 connectport=<port-number> connectaddress=<private-address>
```

## Remove proxy:
```
netsh interface portproxy delete v4tov4 listenport=<port-number> listenaddress=0.0.0.0 connectport=<port-number> connectaddress=<private-address>
```

## List proxies:
```powershell
netsh interface portproxy show v4tov4
```

## Samples

*First IP Address obtained from `wsl hostname -I` = 172.25.81.173

### Angular over WSL:
```powershell
netsh interface portproxy add v4tov4 listenport=4200 listenaddress=0.0.0.0 connectport=4200 connectaddress=172.25.81.173
```

### Django over WSL:
```powershell
netsh interface portproxy add v4tov4 listenport=8000 listenaddress=0.0.0.0 connectport=8000 connectaddress=172.25.81.173
```

### Expo over WSL:
```powershell
netsh interface portproxy add v4tov4 listenport=19000 listenaddress=0.0.0.0 connectport=19000 connectaddress=172.25.81.173
netsh interface portproxy add v4tov4 listenport=19001 listenaddress=0.0.0.0 connectport=19001 connectaddress=172.25.81.173
netsh interface portproxy add v4tov4 listenport=19002 listenaddress=0.0.0.0 connectport=19002 connectaddress=172.25.81.173
```
