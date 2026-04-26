
resource "azurerm_resource_group" "rg_block" {
  name       = var.name
  location   = "Central India"
  managed_by = "Devops_Bhagwa"
  tags = {
    "environment" = var.env
    "Client Name" = var.name
  }
}
