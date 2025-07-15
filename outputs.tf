output "linux_vm_public_ip" {
  description = "The public IP address of the Linux virtual machine."
  value       = module.linux_vm.public_ip
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = module.storage.storage_account_name
}

output "sql_server_name" {
  description = "The FQDN of the SQL server."
  value       = module.sql.sql_server_fqdn
}
