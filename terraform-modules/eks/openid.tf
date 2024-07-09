resource "aws_iam_openid_connect_provider" "eks_openid" {
  url            = aws_eks_cluster.eks.identity.0.oidc.0.issuer
  client_id_list = ["sts.amazonaws.com"]

  thumbprint_list = [
  "3ACE16CA6BAE7B16AAE3707096D1DE7D29093AD8", "7CA6BE9F14E20973CB2C58452DA9B1E2BEB7236B", "CAB073498D7558FEC3B2C414C006ACBA30805431", "598ADECB9A3E6CC70AA53D64BD5EE4704300382A", "750B948515281953BC6F3D717A1E1654ECBFA852"]
}