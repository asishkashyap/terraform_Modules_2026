resource "azurerm_resource_group" "rg_block" {
  name       = "bhagwa-engg-2026"
  location   = "Central India"
  managed_by = "Devops_Bhagwa"
  tags = {
    "enviroment"  = "dev"
    "Client Name" = "Alpha"
  }
}
