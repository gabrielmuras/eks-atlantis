orgAllowlist: "${orgAllowlist}"

github:
  user: "${github_user}"
  token: "${github_token}"
  secret: "${github_webhook_secret}"

aws:
  credentials: |
    [default]
    aws_access_key_id="${atlantis_aws_access_key_id}"
    aws_secret_access_key="${atlantis_aws_secret_access_key}"

atlantisDataDirectory: "${atlantisDataDirectory}"

volumeClaim:
  enabled: false

ingress:
  annotations:
    kubernetes.io/ingress.class: ${ingress_class}
    alb.ingress.kubernetes.io/scheme: ${scheme}
    alb.ingress.kubernetes.io/subnets: ${subnets}