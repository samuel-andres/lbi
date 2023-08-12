# Django devcontainer

`.devcontainer/devcontainer.json`

```
{
  "name": "dc",
  "build": {
    "context": "..",
    "dockerfile": "./Dockerfile"
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-python.flake8",
        "ms-python.black-formatter",
        "matangover.mypy",
        "ms-python.isort"
      ],
      "settings": {
        "python.formatting.provider": "black",
        "python.linting.mypyEnabled": true,
        "python.linting.flake8Enabled": true,
        "[python]": {
          "editor.formatOnSave": true,
          "editor.codeActionsOnSave": {
            "source.organizeImports": true
          },
          "editor.defaultFormatter": "ms-python.black-formatter"
        }
      }
    }
  }
}
```

`.devcontainer/Dockerfile`

```
# Creating image based on alpine
FROM python:3.11.3-alpine

# Labeling with the authors
LABEL maintainer="me"

# Setting GUID and UID
ENV USER="nonroot"
ENV GROUP="nonroot"
ENV UID="1000"
ENV GUID="1000"

# Adding git to the container
RUN apk add git

# Installing deps
RUN apk add \
    --no-cache \
    --upgrade \
    dep1 \
    dep2 \
    ...

# Installing requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

# Creating non-root user + group
RUN addgroup -g $GUID $GROUP && \
    adduser -u $UID -G $GROUP -s /bin/sh -D $USER

# Setting nonroot user in container
USER $USER

```