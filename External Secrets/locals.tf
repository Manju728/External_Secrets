locals {
  new_secret = {
    april_client_id     = var.april_client_id
    april_client_secret = var.april_client_secret
    ista_edge           = var.ista_edge
    scope               = var.scope
    tric_emea           = var.tric_emea
    tric_us             = var.tric_us
  }
}