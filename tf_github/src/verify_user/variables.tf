variable "username" {
  type = "string"
}

variable "realname" {
  type = "string"
  default = ""
}

variable "org_role" {
  type = "string"
  default = "member"
}

variable "teams" {
  type = "list"
  default = []
}
