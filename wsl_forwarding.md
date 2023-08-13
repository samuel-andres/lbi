# WSL Port Forwarding for exposing servers on LAN

**Source**: [Access WSL localhost from LAN](https://medium.com/codemonday/access-wsl-localhost-from-lan-for-mobile-testing-8635697f008)

Example port: 8000

1. Get first IP from `wsl hostname -I`
1. Call `Invoke-Expression "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Inbound -LocalPort 8000 -Action Allow -Protocol TCP";` on PowerShell
1. Forward the port with `netsh interface portproxy add v4tov4 listenport=8000 listenaddress=0.0.0.0 connectport=8000 connectaddress=172.25.81.173`
