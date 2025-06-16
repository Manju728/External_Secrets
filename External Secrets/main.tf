module "secrets_and_roles" {
  source           = "./iamrolesecrets"
  environment      = var.environment
  aws_region       = var.aws_region
  room_id          = var.room_id
  service          = "april-cert-nginx-proxy"
  Namespace        = "tpc"
  # secret_data_json = jsonencode(var.new_secret)
}
