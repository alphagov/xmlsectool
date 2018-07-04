variable "name" {
  type = "string"
}

variable "description" {
  type = "string"
}

variable "private" {
  default = false
}

variable "push_teams" {
  default = []
}

variable "pull_teams" {
  default = []
}
