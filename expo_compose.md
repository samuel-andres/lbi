# Dockerized environment for an expo project

`Dockerfile`:

```Dockerfile
FROM node:16.20-alpine

EXPOSE 19000
EXPOSE 19001
EXPOSE 19002

WORKDIR /app
COPY ./ /app

RUN apk add git

RUN yarn
RUN yarn global add eas-cli@^4.0.0

RUN git config --global --add safe.directory /app

CMD [ "yarn", "start" ]
```

`compose.yml`:

```yml
services:
   app:
      build: .
      ports:
         - 19000:19000
         - 19001:19001
         - 19002:19002
      volumes:
         - ./:/app
         - nodemodules:/app/node_modules

volumes:
  nodemodules:
```