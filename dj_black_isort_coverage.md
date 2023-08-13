# Project configuration for black, isort and coverage

`pyproject.toml`:

```conf
[tool.black]
line-length = 79
force-exclude = "migrations"

[tool.isort]
profile = "black"
filter_files = true
line_length = 79
skip_glob = ["*/migrations/*", "config/*"]

[tool.coverage.run]
omit = [
  "manage.py",
  "*/__init__.py",
  "*/settings.py",
  "*/migrations/*",
  "*/apps.py",
  "*/tests/*",
  "*/tests.py",
  "*/factories/*",
  "*/admin.py",
]
```