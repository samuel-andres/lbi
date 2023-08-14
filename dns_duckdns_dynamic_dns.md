# Setup dynamic dns server for duckdns

`compose.yml`:

```yml
services:
  duckdns:
    image: lscr.io/linuxserver/duckdns:latest
    container_name: duckdns
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Argentina/Buenos_Aires
      - SUBDOMAINS=<your-duckdns-subdomains>
      - TOKEN=<your-duckdns-token>
    volumes:
      - ./appdata/config:/config
    restart: unless-stopped
```