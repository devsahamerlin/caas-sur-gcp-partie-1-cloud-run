locals {
  name_prefix = var.name_prefix
  services_account = jsondecode(file("roles_list.json"))["servicesAccount"]
  sa_flattened = flatten([
    for sa in local.services_account : [
      for role in sa["roles"] : {
        account_id   = sa["account_id"]
        display_name = sa["display_name"]
        role         = role
      }
    ]
  ])
}