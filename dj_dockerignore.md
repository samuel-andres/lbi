# Dockerignore template for django project

`.dockerignore`:

```
# Byte-compiled / optimized / DLL files / mypycache
__pycache__/
**/__pycache__/**
**/__pycache__
*/__pycache__/*
.mypy_cache
*.py[cod]

# C extensions
*.so

# Distribution / packaging
.Python
env/
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
*.egg-info/
.installed.cfg
*.egg

# PyInstaller
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*,cover

# Translations
*.mo
*.pot

# Django stuff:
*.log

# Documentation
docs/_build/
README.md

# PyBuilder
target/

# environment variables
.env.template
.env.test
.env.dev

# vscode environment
.vscode
.devcontainer

# git files
.git
.gitignore

# nginx builder
nginx

# docker files
dockerfiles
.dockerignore
docker-compose*
Dockerfile

# bitbucket files
bitbucket-pipelines.yml

# scripts
scripts
!scripts/runserver.sh
staticfiles
mediafiles
```