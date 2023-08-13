# PEP8 flake configuration for django project

`.flake8`:

```conf
[flake8]

max-doc-length = 72
exclude =
    .git,
    __pycache__,
    */migrations/*,
    __init__.py,
    settings.py
```