terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_id" "id" {
  byte_length = 8
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = "main-vnet"
  depends_on          = [azurerm_resource_group.rg]
}

module "linux_vm" {
  source                = "./modules/virtual_machine"
  is_windows            = false
  vm_name               = "linux-vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  subnet_id             = module.network.vm_subnet_id
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  depends_on            =[azurerm_resource_group.rg]
}

module "storage" {
  source               = "./modules/storage"
  storage_account_name = "stor${random_id.id.hex}"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  container_name       = "container1"
  depends_on           = [azurerm_resource_group.rg]
}

module "sql" {
  source                       = "./modules/sql"
  sql_server_name              = "sqlserver-${random_id.id.hex}"
  sql_database_name            = "sqldb-${random_id.id.hex}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  subnet_id                    = module.network.sql_subnet_id
  depends_on                   = [azurerm_resource_group.rg]
}
