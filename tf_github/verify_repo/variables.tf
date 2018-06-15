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

variable "read_teams" {
  default = []
}

variable "push_team_count" {
  default = 0
}

variable "read_team_count" {
  default = 0
}
