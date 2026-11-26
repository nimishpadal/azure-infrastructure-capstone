resource "azuread_application" "app_registration" {
  for_each     = var.app_display_name
  display_name = each.value.display_name
}
resource "azuread_service_principal" "service_principal" {
  for_each  = var.app_display_name
  client_id = azuread_application.app_registration[each.key].client_id
}