variable "name" {
  type = "string"
}

variable "description" {
  type = "string"
}

variable "private" {
  default = false
}

variable "archived" {
  default = false
}

variable "push_teams" {
  default = []
}

variable "read_teams" {
  default = []
}

variable "allow_push_to_master" {
  default = "false"
}
