resource "helm_release" "atlantis" {
  name       = var.name
  repository = var.repository
  chart      = var.chart
  version    = var.chart_version
  namespace  = var.namespace
  values = [
    templatefile("${path.module}/values/values.yaml.tpl", {
      atlantisDataDirectory          = var.atlantisDataDirectory,
      scheme                         = var.ingress_annotations_type,
      ingress_class                  = var.ingress_annotations_class,
      subnets                        = var.ingress_annotations_subnet,
      orgAllowlist                   = var.orgAllowlist,
      github_user                    = var.github_user,
      github_token                   = var.github_token,
      github_webhook_secret          = var.github_webhook_secret,
      atlantis_aws_access_key_id     = var.atlantis_aws_access_key_id,
      atlantis_aws_secret_access_key = var.atlantis_aws_secret_access_key,
    })
  ]
  depends_on = [kubernetes_namespace.atlantis]
}
