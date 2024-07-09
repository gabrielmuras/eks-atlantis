resource "aws_iam_policy" "kubernetes_alb_controller" {
  name        = "${var.cluster_name}-alb-controller"
  path        = "/"
  description = "Policy for load balancer controller service"

  policy = file("${path.module}/alb_controller_iam_policy.json")
}

data "aws_iam_policy_document" "kubernetes_alb_controller_assume" {

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.cluster_identity_oidc_issuer_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.cluster_identity_oidc_issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:${var.namespace}:${var.service_account_name}",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.cluster_identity_oidc_issuer, "https://", "")}:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "kubernetes_alb_controller" {
  name               = "${var.cluster_name}-alb-controller"
  assume_role_policy = data.aws_iam_policy_document.kubernetes_alb_controller_assume.json
}

resource "aws_iam_role_policy_attachment" "kubernetes_alb_controller" {
  role       = aws_iam_role.kubernetes_alb_controller.name
  policy_arn = aws_iam_policy.kubernetes_alb_controller.arn
}