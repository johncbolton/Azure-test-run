variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "terraform-project-rg"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "West US 2"
}

variable "admin_username" {
  description = "The admin username for the virtual machines and SQL server."
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password for the virtual machines and SQL server."
  type        = string
  sensitive   = true
  default     = "Password1234!"
}
