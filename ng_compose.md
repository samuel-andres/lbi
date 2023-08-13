# Dockerized environment for an Angular project

`Dockerfile`:

```Dockerfile
FROM node:16.20-bullseye # or some debian-based node image

# Set the working directory
WORKDIR /app

EXPOSE 4200

# Copy package.json and yarn.lock
COPY package.json .
COPY yarn.lock .

# Install npm packages
RUN yarn

# Install Angular CLI
RUN yarn global add @angular/cli

# Install dependencies
RUN apt-get update && apt-get install -yq dep1 dep2 ...

# Copy application files
COPY ./app .
```

`compose.yml`

```yml
services:
  app:
    build:
      context: .
    ports:
      - "4200:4200"
    volumes:
      - ./app:/app
      - /app/node_modules
    command: >
      sh -c "ng serve --open --host 0.0.0.0 --port 4200 --disable-host-check"

```
