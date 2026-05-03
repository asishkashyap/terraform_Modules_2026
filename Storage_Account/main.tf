# # Below code is for creating Storage Account
# resource "azurerm_storage_account" "storage_account" {
#   depends_on               = [azurerm_resource_group.rg_block] # Explicit Dependency 
#   name                     = "devopsbhagwa12456"
#   resource_group_name      = "BlueStarDev1"
#   location                 = "Central India"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags = {
#     "environment" = var.env
#     "Client Name" = var.name
#   }
# }