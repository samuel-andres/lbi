# Add custom logs to CloudWatch

Add a `.config` file to .ebextensions folder with the following content,
replacing the placeholder with a regex of the logs files to match against:

```
files:
  "/opt/elasticbeanstalk/tasks/bundlelogs.d/applogs.conf" :
    mode: "000755"
    owner: root
    group: root
    content: |
      {placeholder}
```

Placeholder example:

```
/var/app/current/logs/*.log
```
