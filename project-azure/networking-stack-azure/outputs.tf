output "resource_group_name" { value = azurerm_resource_group.rg.name }
output "vnet_id" { value = azurerm_virtual_network.this.id }

output "public_subnet_ids" {
  value = azurerm_subnet.public[*].id
}

output "private_subnet_ids" {
  value = azurerm_subnet.private[*].id
}

output "nat_public_ip" {
  value = azurerm_public_ip.nat.ip_address
}
