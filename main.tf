resource "azurerm_resource_group" "capstone" {
  name     = "rg-az001-capstone"
  location = "Central India"

  tags = {
    project     = "AZ-001"
    Environment = "Shared"
    ManagedBy   = "Terraform"
  }
}