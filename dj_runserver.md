# Scripts for running django server

`runserver.sh`:

```sh
#!/bin/sh

python3 manage.py migrate --noinput
python3 manage.py collectstatic --noinput
gunicorn {app_name}.wsgi:application -c gunicorn.conf.py
```

`runserver.dev.sh`:

```sh
#!/bin/sh

python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8000
```