# Start a django project with predefined structure

The structure contains the core app and the apps dir

```sh
#!/bin/bash

set -euo pipefail

# Build the docker containers
docker compose build

# Create a new Django project with the given project name
docker compose run --rm app sh -c "django-admin startproject $1 ."

# Create a core app inside the project
docker compose run --rm app sh -c "mkdir $1/core"
docker compose run --rm app sh -c "cd $1/core && mkdir factories && touch factories/__init__.py"
docker compose run --rm app sh -c "python manage.py startapp core $1/core"

# Add the project directory to the Python path
search='BASE_DIR = Path(__file__).resolve().parent.parent'
replace='BASE_DIR = Path(__file__).resolve().parent.parent\nsys.path.append(f"{str(BASE_DIR)}/'"$1"'")'
sed -i "s|$search|$replace|" $1/settings.py

# Import sys along with Path from pathlib in settings.py
search='from pathlib import Path'
replace='import sys\nfrom pathlib import Path'
sed -i "s|$search|$replace|" $1/settings.py

# Create the apps directory
APP_DIR="$1/apps"
mkdir "$APP_DIR"
touch "$APP_DIR/__init__.py"

```