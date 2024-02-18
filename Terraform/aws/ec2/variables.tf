variable "instance_type" {
  default = "t2.micro"
  type = string
}

variable "ami" {
  default = "ami-0c20d88b0021158c6"
  type = string
}

variable "key_name" {
  type = string
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "user_data" {
  type = string
  default = ""
}

variable "tags" {
  type = object({
    Project = string
    CreatedBy = string
    CreatedOn = string
    Environment = string
  })
}