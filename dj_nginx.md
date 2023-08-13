# Set up nginx in a dockerized django environment

`Dockerfile`:

```Dockerfile
FROM nginx:1.23.4-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
```

`nginx.conf`:

```conf
upstream appname {
    server app:8000;
}

server {
    listen 80;

    location / {
        proxy_pass http://appname;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_redirect off;
    }

    location /static/ {
        alias /app/staticfiles/;
    }

}
```