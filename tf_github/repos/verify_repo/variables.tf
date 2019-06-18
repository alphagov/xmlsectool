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

variable "strict_status_check" {
  default     = false
  description = "Whether to require branches to be up-to-date before merging."
}

variable "read_collaborators" {
  type        = "list"
  default     = []
  description = "Users who need read-only access, and aren't part of alphagov or a relevant team."
}
