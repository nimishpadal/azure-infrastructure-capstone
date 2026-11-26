variable "app_display_name" {
  description = "Display Names of App Registrations"
  type = map(object({
    display_name = string
  }))
}
