variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "branch_name" {
  type = string
}

variable "full_repo_name" {
  type = string
}

variable "app_name" {
  type = string
}

variable "deployment_group" {
  type = string
}

variable "resources_arn" {
  type = list(string)
}