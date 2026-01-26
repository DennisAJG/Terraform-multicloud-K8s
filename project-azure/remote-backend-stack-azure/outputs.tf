output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "container_name" {
  value = azurerm_storage_container.container.name
}

output "backend_block_example" {
  value = <<EOT
terraform {
  backend "azurerm" {
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    storage_account_name = "${azurerm_storage_account.sa.name}"
    container_name       = "${azurerm_storage_container.container.name}"
    key                  = "dev/terraform.tfstate"
  }
}
EOT
}
