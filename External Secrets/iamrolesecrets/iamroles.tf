data "aws_iam_policy_document" "read_env_secrets" {
  statement {
    sid    = "allow4wheelstoreadsecrets"
    effect = "Allow"

    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      "arn:aws:secretsmanager:${var.aws_region}:${var.room_id}:secret:${var.environment}/*"
    ]
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "oidc.eks.${var.aws_region}.amazonaws.com/id/E4D94E74B9282088ECDC5AC25092593D:sub"
      values = [
        for svc in var.services : "system:serviceaccount:${var.Namespace}-${var.environment}:${svc}-secrets"
      ]
    }

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${var.room_id}:oidc-provider/oidc.eks.${var.aws_region}.amazonaws.com/id/E4D94E74B9282088ECDC5AC25092593D"]
    }
  }
}

resource "aws_iam_role" "env_secrets_access" {
  name               = "fetch-secrets-${var.environment}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "env_secret_read_policy" {
  description = "Access to 4wheels cluster to read secrets from aws secrets"
  name   = "read-secrets-${var.environment}"
  policy = data.aws_iam_policy_document.read_env_secrets.json
}

resource "aws_iam_role_policy_attachment" "attach_env_secret_policy" {
  role       = aws_iam_role.env_secrets_access.name
  policy_arn = aws_iam_policy.env_secret_read_policy.arn
}
