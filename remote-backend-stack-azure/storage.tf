resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

# Storage account name deve ser:
# - único globalmente
# - apenas letras minúsculas e números
# - 3 a 24 caracteres
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  storage_account_name = substr(
    lower(replace("${var.storage_account_name_prefix}${random_string.suffix.result}", "/[^a-z0-9]/", "")),
    0,
    24
  )
}

resource "azurerm_storage_account" "sa" {
  name                = local.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Segurança recomendada
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = true

  blob_properties {
    versioning_enabled = true
  }

  tags = var.tags
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
