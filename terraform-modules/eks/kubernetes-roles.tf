resource "aws_iam_role" "eks_admin_role" {
    name = "eks-admin"

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
        {
            Effect = "Allow",
            Principal = {
            Service = "eks.amazonaws.com"
            },
        Action = "sts:AssumeRole"
        }
    ]
    })

    managed_policy_arns = [
        "arn:aws:iam::aws:policy/AdministratorAccess"
    ]
}

resource "aws_iam_role" "eks_readonly_role" {
    name = "eks-read-only"

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
        {
            Effect = "Allow",
            Principal = {
            Service = "eks.amazonaws.com"
        },
        Action = "sts:AssumeRole"
        }
    ]
    })
    managed_policy_arns = [
        "arn:aws:iam::aws:policy/ReadOnlyAccess"
    ]
}