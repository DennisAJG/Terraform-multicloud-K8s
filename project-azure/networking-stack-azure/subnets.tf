resource "azurerm_subnet" "public" {
  count                = length(var.network.public_subnets)
  name                 = var.network.public_subnets[count.index].name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.network.public_subnets[count.index].address_prefix]
}

resource "azurerm_subnet" "private" {
  count                = length(var.network.private_subnets)
  name                 = var.network.private_subnets[count.index].name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.network.private_subnets[count.index].address_prefix]
}
