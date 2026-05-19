# Below code is for creating Resource Group using For_Each Meta Argument
resource "azurerm_resource_group" "rg_block_forEach" {
  for_each = var.rgName # har ek ke liye
  name     = "rg-${each.value.name}"
  location = each.value.location

}





