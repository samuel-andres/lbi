# Add a leader-only cronjob to EB Load Balanced environment

**Source**: [AWS EB Samples - cron-leaderonly](https://github.com/awsdocs/elastic-beanstalk-samples/blob/main/configuration-files/aws-provided/instance-configuration/cron-leaderonly-linux.config)

Example configuration file for running a django management command:

```
packages:
  yum:
    jq: []

files:
  "/usr/local/bin/test_cron.sh":
    mode: "000755"
    owner: root
    group: root
    content: |
      #!/bin/bash

      INSTANCE_ID=`curl http://169.254.169.254/latest/meta-data/instance-id 2>/dev/null`
      REGION=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document 2>/dev/null | jq -r .region`

      # Find the Auto Scaling Group name from the Elastic Beanstalk environment
      ASG=`aws ec2 describe-tags --filters "Name=resource-id,Values=$INSTANCE_ID" \
          --region $REGION --output json | jq -r '.[][] | select(.Key=="aws:autoscaling:groupName") | .Value'`

      # Find the first instance in the Auto Scaling Group
      FIRST=`aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names $ASG \
          --region $REGION --output json | \
          jq -r '.AutoScalingGroups[].Instances[] | select(.LifecycleState=="InService") | .InstanceId' | sort | head -1`

      # If the instance ids are the same or $FIRST is empty, exit 0
      if [ -z "$FIRST" ] || [ "$FIRST" = "$INSTANCE_ID" ]; then
          exit 0
      fi

  "/usr/local/bin/command_caller.sh":
    mode: "000755"
    owner: root
    group: root
    content: |
      #!/bin/bash
      /usr/local/bin/test_cron.sh || exit

      docker exec current_app_1 python manage.py command

  "/etc/cron.d/command_caller":
    mode: "000644"
    owner: root
    group: root
    content: |
      */10 * * * * root /usr/local/bin/command_caller.sh

commands:
  rm_old_cron:
    command: "rm -fr /etc/cron.d/command_caller.bak"
    ignoreErrors: true
```