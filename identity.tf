resource "azuread_application" "app_registration" {
  for_each     = var.app_display_name
  display_name = each.value.display_name
}
resource "azuread_service_principal" "service_principal" {
  for_each  = var.app_display_name
  client_id = azuread_application.app_registration[each.key].client_id
}

resource "azurerm_role_assignment" "rbac_assignments" {
  for_each             = local.storage_container_ids
  role_definition_name = "Storage Blob Data Contributor"
  scope                = each.value
  principal_type       = "ServicePrincipal"
  principal_id         = azuread_service_principal.service_principal[each.key].object_id
}