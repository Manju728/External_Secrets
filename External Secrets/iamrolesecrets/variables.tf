variable "environment" {
  description = "Deployment environment/stage (e.g. test,e2e, prod or int)"
  default     = ""
}

variable "project" {
  description = "Project whom the stack belongs to"
  default     = "aos"
}

variable "services" {
  description = "Deployment services"
  type        = list(string)
  default     = ["qa2", "test", "prod", "int"]
}

variable "aws_region" {
  description = "AWS Region in which resource are deployed in"
  type        = string
  default     = "eu-central-1"
}

variable "room_id" {
  description = "AWS room id. Must be between 1 and 64 characters in length."
  type        = number
  default     = 332361950671
}

variable "service" {
  description = "Service name"
  type        = string
  default     = ""
}

variable "Namespace" {
  description = "k8s namespace prefix"
  type        = string
  default     = "tpc"
}

variable "combined_secret_json" {
  description = "JSON-encoded secret data"
}

variable "april_client_id" {
  type        = string
  sensitive   = true
}
variable "april_client_secret" {
  type        = string
  sensitive   = true
}
variable "ista_edge" {
  type        = string
  sensitive   = true
}
variable "scope" {
  type        = string
  sensitive   = true
}
variable "tric_emea" {
  type        = string
  sensitive   = true
}
variable "tric_us" {
  type        = string
  sensitive   = true
}