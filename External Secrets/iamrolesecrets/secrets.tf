resource "random_string" "string_random" {
  length  = 30  # Set the desired length of the random string
  upper   = true  # Include uppercase letters in the random string
  special = false
  lower   = false
}
locals {
  secret_data = jsondecode(var.secret_data_json)
  random_s = random_string.string_random.result
}

resource "aws_secretsmanager_secret" "external_secrets" {
  name = "${var.environment}-${var.service}-secrets-${local.random_s}"
#   name_prefix = "${var.environment}-"
}


resource "aws_secretsmanager_secret_version" "my_secret_version" {
  secret_id     = aws_secretsmanager_secret.external_secrets.id
  secret_string = jsonencode(local.secret_data)
}

output "secret_name" {
  value = local.random_s
}