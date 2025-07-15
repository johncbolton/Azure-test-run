output "vm_subnet_id" {
  value = azurerm_subnet.vm_subnet.id
}

output "sql_subnet_id" {
  value = azurerm_subnet.sql_subnet.id
}
