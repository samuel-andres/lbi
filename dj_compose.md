# Dockerized environment for a django app with postgres, pgadmin, celery and redis

`compose.yml`:

```yml
services:
  app:
    build: .
    ports:
      - 8000:8000
    volumes:
      - .:/app
      - static-data:/app/staticfiles
    env_file:
      - .env
    depends_on:
      - db
      - redis

  db:
    image: postgis/postgis:15-3.3-alpine
    expose:
      - 5432
    volumes:
      - db-data:/var/lib/postgresql/data
    env_file:
      - .env

  pgadmin:
    image: dpage/pgadmin4:7.1
    ports:
      - 5050:80
    volumes:
      - pgadmin-data:/var/lib/pgadmin
    environment:
      - GUNICORN_ACCESS_LOGFILE=/dev/null
      - PGADMIN_CONFIG_UPGRADE_CHECK_ENABLED=False
    env_file:
      - .env

  redis:
    image: redis:7.0.12-alpine

  celery:
    build: .
    command: celery --app alertify worker --loglevel=info
    volumes:
      - .:/app
    env_file:
      - .env
    depends_on:
      - app
      - redis

  # just for production:
  sv:
    image: builtimage # from nginx
    expose:
      - 80
    volumes:
      - static-data:/app/staticfiles
    depends_on:
      - app

volumes:
  db-data:
  pgadmin-data:
  static-data:
```

`Dockerfile`:

```Dockerfile
# Creating base image based on alpine --STAGE=1
FROM python:3.11.3-alpine AS base

# Labeling with the authors
LABEL maintainer="maintainer"

# Setting venv dir and adding it to the path
ENV VIRTUAL_ENV="/opt/venv"
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Fixing python printing
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Setting GUID and UID
ENV USER="nonroot"
ENV GROUP="nonroot"
ENV UID="1000"
ENV GUID="1000"

# Creating builder image from base --STAGE=2
FROM base AS builder

# Creating virtualenv
RUN python3 -m venv $VIRTUAL_ENV

# Installing requirements
COPY requirements.txt /

RUN pip install \
    --upgrade pip && \
    pip install \
    --no-cache-dir \
    --requirement \
    requirements.txt

# Creating final image from base --STAGE=3
FROM base AS final

# Installing deps
RUN apk add \
    --no-cache \
    --upgrade \
    dep1 \
    dep2 \
    ...

# Copying venv from builder image
COPY --from=builder $VIRTUAL_ENV $VIRTUAL_ENV

# Creating non-root user + group
RUN addgroup -g $GUID $GROUP && \
    adduser -u $UID -G $GROUP -s /bin/sh -D $USER

# Set nonroot user permissions
RUN mkdir /app && \
    chown $USER /app && \
    mkdir /app/staticfiles && \
    chown $USER /app/staticfiles

# Setting working directory
WORKDIR /app

# Getting the source code
COPY --chown=$USER . .

# Set current user to nonroot
USER $USER

# Indicating port that needs to be exposed
EXPOSE 8000

# Running server
CMD [ "scripts/runserver.sh" ]
```

`celery.py`:

```python
import os

from celery import Celery

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "appname.settings")

app = Celery(
    "appname",
    broker_connection_retry=False,
    broker_connection_retry_on_startup=True,
    broker_connection_max_retries=10,
)

app.config_from_object("django.conf:settings", namespace="CELERY")

app.autodiscover_tasks()
```

`settings.py`:

```python
...
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql" # or "django.contrib.gis.db.backends.postgis"
        "NAME": env("DB_NAME", "appname_db"),
        "USER": env("DB_USER", "appname_user"),
        "PASSWORD": env("DB_PASSWORD", "appname_password"),
        "HOST": env("DB_HOST", "db"),
        "DB_PORT": env("DB_PORT", "5432"),
    }
}

...
CELERY_BROKER_URL = env("CELERY_BROKER", "redis://redis:6379/0")
CELERY_RESULT_BACKEND = env("CELERY_BROKER", "redis://redis:6379/0")
```