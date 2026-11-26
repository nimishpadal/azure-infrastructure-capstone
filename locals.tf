locals {
  storage_container_ids = {
    dev  = azurerm_storage_container.sc_capstone_dev.id
    test = azurerm_storage_container.sc_capstone_test.id
  }
}