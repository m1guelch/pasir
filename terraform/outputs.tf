output "vm_id" {
  description = "Virtual Machine ID"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_public_ip" {
  description = "Public IP address of the Virtual Machine"
  value       = azurerm_public_ip.vm_public_ip.ip_address
}
