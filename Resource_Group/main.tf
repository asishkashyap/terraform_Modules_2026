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
    ignore_changes = [ # This is used to ignore changes in the managed_by field because it may get modified by Azure Portal or any other means . Due to which Terraform used to think that something has changed in the resource group and used to try to update it .
      managed_by       # By doing this we are telling Terraform to ignore the changes in the managed_by field and not to try to update it .
    ]
  }

}

# Below code is for creating Resource Group using For_Each Meta Argument
resource "azurerm_resource_group" "rg_block_forEach" {
  for_each = var.rgName # har ek ke liye
  name     = each.value.name
  location = each.value.location

}

resource "azurerm_resource_group" "rg_hcl" {
  name     = "rg-hcl-test"
  location = "central india"
}

# below code is for creating network security group 
resource "azurerm_network_security_group" "nsg_hcl" {
  name                = "nsg-hcl-test"
  location            = azurerm_resource_group.rg_hcl.location
  resource_group_name = azurerm_resource_group.rg_hcl.name
}

# below code is for creating virtual network
resource "azurerm_virtual_network" "vnet_hcl" {
  name                = "vnet-hcl"
  location            = azurerm_resource_group.rg_hcl.location
  resource_group_name = azurerm_resource_group.rg_hcl.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "sub-hcl-frontend"
    address_prefixes = ["10.0.1.0/24"]
    security_group   = azurerm_network_security_group.nsg_hcl.id
  }

  subnet {
    name             = "sub-hcl-backend"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.nsg_hcl.id #Implicit Dependency
  }

  tags = {
    environment = "Test"
  }
}




