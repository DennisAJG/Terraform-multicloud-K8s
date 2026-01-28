resource "azurerm_route_table" "public" {
  name                = var.network.public_route_table_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = var.tags
}

resource "azurerm_subnet_route_table_association" "public" {
  count          = length(azurerm_subnet.public)
  subnet_id      = azurerm_subnet.public[count.index].id
  route_table_id = azurerm_route_table.public.id
}
