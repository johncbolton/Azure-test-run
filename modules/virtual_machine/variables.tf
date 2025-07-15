variable "is_windows" {
  description = "Set to true to create a Windows VM, false for Linux."
  type        = bool
}

variable "vm_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "subnet_id" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
