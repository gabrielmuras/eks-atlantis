resource "kubernetes_namespace" "atlantis" {
  metadata {
    name = var.namespace
  }
}
