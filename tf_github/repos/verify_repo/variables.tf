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
