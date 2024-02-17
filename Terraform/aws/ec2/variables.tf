variable "instance_type" {
  default = "t2.micro"
  type = string
}

variable "key_name" {
  type = string
}

variable "tags" {
  type = object({
    Project = string
    CreatedBy = string
    CreatedOn = string
    Environment = string
  })
}