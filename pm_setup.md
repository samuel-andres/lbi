# NGINX Proxy Manager Setup

`compose.yml`:

```yml
services:
  app:
    image: jc21/nginx-proxy-manager:latest
    container_name: nginxpm
    restart: unless-stopped
    ports:
      - 80:80
      - 81:81
      - 443:443
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt

networks:
  default:
    name: my_network
```

Then you should attach all of your compose environments to the `my_network` network.
PM interface is available on port 81.
Ports 80 and 443 should be open on your router.