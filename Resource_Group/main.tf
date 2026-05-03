# Below code is for creating Resource Group using Count Meta Argument
resource "azurerm_resource_group" "rg_block_Count" {
  count      = 2
  name       = "rg-bluestar-infra-${var.name[count.index]}" # whenever you are calling a variable's value, always use ${}
  location   = var.location[count.index]
  managed_by = "Devops_Bhagwa"
  tags = {
    "Client Name" = var.name[count.index]
  }
  lifecycle {
    ignore_changes = [        # This is used to ignore changes in the managed_by field because it may get modified by Azure Portal or any other means . Due to which Terraform used to think that something has changed in the resource group and used to try to update it .
      managed_by               # By doing this we are telling Terraform to ignore the changes in the managed_by field and not to try to update it .
    ]
  }

}


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

# Below code is for creating Resource Group using For_Each Meta Argument
resource "azurerm_resource_group" "rg_block_forEach" {
  for_each = var.rgName
  name     = each.value.name
  location = each.value.location

}

