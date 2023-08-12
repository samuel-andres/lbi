# Redirect http to https on Elastic Load Balancer

**Source**: [AWS EB Samples - http2https](https://github.com/awsdocs/elastic-beanstalk-samples/blob/main/configuration-files/aws-provided/resource-configuration/alb-http-to-https-redirection.config)

Add a `.config` file to .ebextensions folder with the following content:

```
Resources:
 AWSEBV2LoadBalancerListener:
  Type: AWS::ElasticLoadBalancingV2::Listener
  Properties:
    LoadBalancerArn:
      Ref: AWSEBV2LoadBalancer
    Port: 80
    Protocol: HTTP
    DefaultActions:
      - Type: redirect
        RedirectConfig:
          Host: "#{host}"
          Path: "/#{path}"
          Port: "443"
          Protocol: "HTTPS"
          Query: "#{query}"
          StatusCode: "HTTP_301"
```
