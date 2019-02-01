variable "username" {
  type = "string"
}

variable "realname" {
  type        = "string"
  description = "Not used for any configuration, just useful for working out who people are"
}

variable "verify_admin" {
  default = "false"
}

variable "can_merge" {
  default = "false"
}

variable "teams" {
  type    = "list"
  default = []
}
