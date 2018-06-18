variable "name" {
  type = "string"
}

variable "description" {
  type = "string"
}

variable "private" {
  default = false
}

variable "master_users" {
  default = []
}

variable "push_teams" {
  default = []
}

variable "pull_teams" {
  default = []
}
