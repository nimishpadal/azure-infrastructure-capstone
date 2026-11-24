resource "azurerm_resource_group" "capstone" {
  name     = "rg-az001-capstone"
  location = "Central India"

  tags = {
    project     = "AZ-001"
    Environment = "Shared"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_storage_account" "sa_capstone" {
  name                = "az001sacapstone"
  resource_group_name = azurerm_resource_group.capstone.name
  location            = azurerm_resource_group.capstone.location

  account_tier             = "Standard"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
  account_replication_type = "LRS"

  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false

  shared_access_key_enabled       = false
  default_to_oauth_authentication = true
  local_user_enabled              = false

  blob_properties {
    versioning_enabled = true
    container_delete_retention_policy {
      days = 7
    }
    delete_retention_policy {
      days = 7
    }
  }

  tags = {
    project     = "AZ-001"
    Environment = "Shared"
    ManagedBy   = "Terraform"
  }

}

resource "azurerm_storage_container" "sc_capstone_dev" {
  name               = "az001sccapstonedev"
  storage_account_id = azurerm_storage_account.sa_capstone.id

}
resource "azurerm_storage_container" "sc_capstone_test" {
  name               = "az001sccapstonetest"
  storage_account_id = azurerm_storage_account.sa_capstone.id
}