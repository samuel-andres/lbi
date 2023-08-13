# Create a new app in a django project inside apps dir

```sh
#!/bin/bash

set -euo pipefail

# Check if the app_name parameter is provided
if [ -z "$1" ]; then
    echo "Error: app_name parameter is missing"
    exit 1
fi

# Set the root directory to the parent of the script's directory

# Find the apps directory
APPS_DIR=$(find ./ -type d -name apps -not -path "./.mypy_cache/*")
echo $APPS_DIR

# Create app directory and files
cd $APPS_DIR
mkdir "$1"
cd "$1"

# Run Django's `startapp` command inside a Docker container
docker compose run --rm app sh -c "python manage.py startapp $1 $APPS_DIR/$1" || exit 1

# Create tests directory and files
rm -f tests.py
mkdir tests
cd tests
touch __init__.py test_models.py test_serializers.py test_urls.py test_views.py
cd ..

# Create models directory and files
rm -f models.py
mkdir models
cd models
touch __init__.py
cd ..

# Create api directory and files
rm -f views.py
mkdir api
cd api
touch views.py urls.py serializers.py docs.py __init__.py
cd ..

# Update apps.py file
sed -i "/name =/d" apps.py
echo "    name = 'apps.$1'" >> apps.py
echo "    label = '$1_app'" >> apps.py

# Display success message
echo "Success! The app $1 has been added. Don't forget to add 'apps.$1' to your project's LOCAL_APPS in settings.py."

exit 0

```