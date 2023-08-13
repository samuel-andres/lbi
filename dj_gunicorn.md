# Configuration for wsgi gunicorn

`gunicorn.conf.py`

```python
backlog = 2048
chdir = "/app"
bind = "0.0.0.0:8000"
daemon = False
debug = False
workers = 4
loglevel = "info"
umask = 0000
timeout = 300
```