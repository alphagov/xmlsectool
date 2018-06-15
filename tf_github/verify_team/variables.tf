variable "name" {
  type = "string"
}

variable "description" {
  type = "string"
}

variable "privacy" {
  default = "closed"
}

variable "members" {
  type = "list"
}

variable "maintainers" {
  default = []
}
