variable "username" {
  type = "string"
}

variable "org_role" {
  type = "string"
  default = "member"
}

variable "teams" {
  type = "map"
}
