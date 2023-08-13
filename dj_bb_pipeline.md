# Bitbucket pipeline for a django project


Bitbucket pipeline for a django project with main, staging and dev branches. Including the testing, linting, type-checking and image building.


```yml
pipelines:
  branches:
    main:
      - step:
          name: Testing and linting
          image: python:3.11.3-alpine
          services:
            - postgres
          script:
            # Installing deps
            - apk add --no-cache --upgrade dep1 dep2 ...
            # Installing requirements
            - pip install -r requirements.txt
            # Running test suite
            - python manage.py test
            # Running linter
            - flake8
            # Running type-checker
            - mypy .
      - step:
          name: Building and deploying
          services:
          - docker
          script:
            # Login to dockerhub with your credentials
            - docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD
            # Pulling previous release
            - docker pull dhuser/dhrepo:latest
            # Building new release
            - docker build --cache-from dhuser/dhrepo:latest --tag dhrepo:0.0.1-alpha .
            # Tag new release with specific version and latest
            - docker tag dhrepo:0.0.1-alpha dhuser/dhrepo:0.0.1-alpha
            - docker tag dhrepo:0.0.1-alpha dhuser/dhrepo:latest
            # Push the new release to each tag
            - docker push dhuser/dhrepo:0.0.1-alpha
            - docker push dhuser/dhrepo:latest
    staging:
      - step:
          name: Testing and linting
          image: python:3.11.3-alpine
          services:
            - postgres
          script:
            # Installing deps
            - apk add --no-cache --upgrade dep1 dep2 ...
            # Installing requirements
            - pip install -r requirements.txt
            # Running test suite
            - python manage.py test
            # Running linter
            - flake8
            # Running type-checker
            - mypy .
      - step:
          name: Building and deploying
          services:
          - docker
          script:
            # Login to dockerhub with synapta credentials
            - docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD
            # Pulling previous release
            - docker pull dhuser/dhrepo:staging
            # Building new release
            - docker build --cache-from dhuser/dhrepo:staging --tag dhrepo:0.0.1-alpha .
            # Tag new release with specific version and latest
            - docker tag dhrepo:0.0.1-alpha dhuser/dhrepo:0.0.1-alpha
            - docker tag dhrepo:0.0.1-alpha dhuser/dhrepo:staging
            # Push the new release to each tag
            - docker push dhuser/dhrepo:0.0.1-alpha
            - docker push dhuser/dhrepo:staging
    dev:
      - step:
          image: python:3.11.3-alpine
          name: Testing and linting
          services:
            - postgres
          script:
            # Installing deps
            - apk add --no-cache --upgrade dep1 dep2 ...
            # Installing requirements
            - pip install -r requirements.txt
            # Running test suite
            - python manage.py test
            # Running linter
            - flake8
            # Running type-checker
            - mypy .

definitions:
  services:
    postgres:
      image: postgres:15-3.3-alpine
      variables:
        POSTGRES_DB: $POSTGRES_DB
        POSTGRES_USER: $POSTGRES_USER
        POSTGRES_PASSWORD: $POSTGRES_PASSWORD

```