variable "location" {
  type = string
  default = "East US"
}

variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "replication_type" {
  type = string
  default = "GRS"
}