# Angular devcontainer

`Dockerfile`:

```Dockerfile
# Creting image based on node bullseye
FROM node:16.20-bullseye

# Set the working directory
WORKDIR /app
EXPOSE 4200

# Install dependencies
RUN apt-get update && apt-get install -yq dep1 dep2 ...

# Setting nonroot user in container
USER "node"
```


`devcontainer.json`:

```json
{
  "name": "ng-dc",
  "build": {
    "context": "..",
    "dockerfile": "./Dockerfile"
  },
  "postCreateCommand": "cd app && yarn"
}
```