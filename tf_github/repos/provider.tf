variable "github_token" {
  type = "string"
}

variable "github_organization" {
  default = "alphagov"
}

provider "github" {
  token        = "${var.github_token}"
  organization = "${var.github_organization}"
}
