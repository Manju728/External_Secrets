resource "random_string" "string_random" {
  length  = 30  # Set the desired length of the random string
  upper   = true  # Include uppercase letters in the random string
  special = false
  lower   = false
}
locals {
  combined_secret_data = {
    april_client_id     = var.april_client_id
    april_client_secret = var.april_client_secret
    ista_edge           = var.ista_edge
    scope               = var.scope
    tric_emea           = var.tric_emea
    tric_us             = var.tric_us
  }

  combined_secret_json = jsonencode(local.combined_secret_data)
  random_s = random_string.string_random.result
}


resource "aws_secretsmanager_secret" "external_secrets" {
  name = "${var.environment}-${var.service}-secrets-${local.random_s}"
#   name_prefix = "${var.environment}-"
}


resource "aws_secretsmanager_secret_version" "my_secret_version" {
  secret_id     = aws_secretsmanager_secret.external_secrets.id
  secret_string = local.combined_secret_json
}

output "secret_name" {
  value = local.random_s
}