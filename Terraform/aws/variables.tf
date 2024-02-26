variable "project" {
  default = "test-gabriel-taveira"
  type = string
}

variable "key_name" {
  default = "gabriel-taveira"
  type = string
}

variable "created_by" {
  default = "gabriel-taveira"
  type = string
}

variable "branch_name" {
  default = "main"
  type = string
}

variable "full_repo_name" {
  type = string
  default = "Gabs-Leo/API-NodeExample"
}

variable "infra_branch_name" {
  default = "feature/terraform-aws-codepipeline"
  type = string
}

variable "infra_full_repo_name" {
  type = string
  default = "Gabs-Leo/infra"
}

variable "record_name" {
  type = string
}

variable "hosted_zone_id" {
  type = string
}

variable "acm_certificate_arn" {
  type = string
}