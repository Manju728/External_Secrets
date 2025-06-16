variable "environment" {
  description = "Deployment environment/stage (e.g. test,e2e, prod or int)"
  default     = "qa2"
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

# variable "new_secret" {
#   default = {
#     "APRIL_CLIENT_ID" : "7e7ef65b-1b4f-483c-bb79-de76d865bee2",
#     "APRIL_CLIENT_SECRET" : "FG206HLu8hiCJndiCJGY3vZv7YJPXye58j5Zmyls",
#     "SCOPE" : "machine2machine client_7e7ef65b-1b4f-483c-bb79-de76d865bee2",
#     "TRIC_EMEA" : "QkRSX1RSWl9FTUVBX1FBOjJiSzFxZUM1emxEdFJxZHBLQmxP",
#     "TRIC_US" : "QkRSX1RSWl9VU19RQTpWMDVCSHBJbWJqRVM2dXpENHlZcA",
#     "ISTA_EDGE" : "YjJpdXNlcjozZXd0RU5wUmQtYixxdWo3"
#   }
#   }

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