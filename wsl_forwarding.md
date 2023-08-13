# WSL Port Forwarding for exposing servers on LAN

**Source**: [Access WSL localhost from LAN](https://medium.com/codemonday/access-wsl-localhost-from-lan-for-mobile-testing-8635697f008)

1. Get first IP from `wsl hostname -I`
2. Call `New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Inbound -LocalPort <your-port> -Action Allow -Protocol TCP";` on PowerShell
3. Forward the port with `netsh interface portproxy add v4tov4 listenport=<your-port> listenaddress=0.0.0.0 connectport=<your-port> connectaddress=<your-ip-from-step-one>`

Detailed explanation with samples on [Managing firewall rules on Windows through PowerShell](psh_firewall_rules.md) and [Managing port proxies on Windows through netsh](nsh_portproxy.md)
