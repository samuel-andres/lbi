# lbi

Little bits of information.

![y2k](./assets/y2k.jpg)

## Current prefixes:
- **eb**: Elastic Beanstalk
- **aws**: Amazon Web Services
- **dj**: Django
- **ssh**: Secure Shell
- **expo**: Expo
- **ng**: Angular
- **wsl**: Windows Subsystem for Linux
- **zsh**: Z Shell
- **psh**: PowerShell
- **nsh**: Network Shell
- **dns**: Domain Name System
- **npm**: NGINX Proxy Manager
- **adb**: Android Debug Bridge
- **linux**: Linux

## Index

### Elastic Beanstalk
- [Redirect http to https on Elastic Load Balancer](eb_http_to_https.md)
- [Setup EB CLI](eb_cli_setup.md)
- [Add a leader-only cronjob to EB Load Balanced environment](eb_cron_leaderonly.md)
- [Add custom logs to CloudWatch](eb_custom_logs_to_cloudwatch.md)

### Aamazon Web Services
- [Setup AWS CLI](aws_cli_setup.md)

### Django
- [Abstract validation serializer](dj_abstract_validation_serializer.md)
- [Helper for calculating a person age on django](dj_age.md)
- [Bitbucket pipeline for a django project](dj_bb_pipeline.md)
- [Project configuration for black, isort and coverage](dj_black_isort_coverage.md)
- [Pattern for using celery tasks on a django project](dj_celery_pattern.md)
- [Dockerized environment for a django app with postgres, pgadmin, celery and redis](dj_compose.md)
- [Create a new app in a django project inside apps dir](dj_create_app.md)
- [Django devcontainer](dj_devcontainer.md)
- [Custom DNI field](dj_dni_field.md)
- [Dockerignore template for django project](dj_dockerignore.md)
- [PEP8 flake configuration for django project](dj_flake8.md)
- [Configuration for wsgi gunicorn](dj_gunicorn.md)
- [mypy configuration for django project](dj_mypy.md)
- [Set up nginx in a dockerized django environment](dj_nginx.md)
- [Fix geos and gdal library paths](dj_postgis_fix_deps.md)
- [Scripts for running django server](dj_runserver.md)
- [Start a django project with predefined structure](dj_start_project.md)
- [Setup for django testing environment](dj_test_setup.md)
- [GIS mixin widget for django unfold](dj_unfold_geo_admin_mixin.md)
- [Django finite state machine](dj_fsm.md)

### Secure Shell
- [Set up ssh bastion host](ssh_bastion.md)
- [Set up ssh for multiple bitbucket accounts](ssh_multi_bb.md)

### Expo
- [Dockerized environment for an expo project](expo_compose.md)
- [Expo dotenv configuration](expo_dotenv.md)


### Angular
- [Dockerized environment for an Angular project](ng_compose.md)
- [Angular devcontainer](ng_devcontainer.md)

### Windows Subsystem for Linux
- [WSL Port Forwarding for exposing servers on LAN](wsl_forwarding.md)
- [Free Up WSL2 space](wsl_cleanup.md)

### Z Shell
- [Custom ZSH prompt](zsh_prompt.md)

### PowerShell
- [Managing firewall rules on Windows through PowerShell](psh_firewall_rules.md)

### Network Shell
- [Managing port proxies on Windows through Network Shell](nsh_portproxy.md)

### Domain Name System
- [Setup dynamic dns server for duckdns](dns_duckdns_dynamic_dns.md)

### NGINX Proxy Manager
- [NGINX Proxy Manager Setup](npm_setup.md)
- [NGINX Proxy Manager Reset Password](npm_reset_password.md)

### Android Debug Bridge
- [ADB Wireless Connection](adb_wireless.md)

### Linux
- [Fix laggy firefox videos on Linux with Intel Iris Xe](linux_intel_iris_xe_fix_firefox_laggy_videos.md)
- [Fix media not loading on Firefox Linux with Intel Iris XE](linux_intel_iris_xe_fix_firefox_media_not_loading.md)
- [Fix tearing issues on Linux with Intel Iris](linux_intel_iris_xe_fix_tearing.md)
