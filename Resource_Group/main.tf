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




# resource "azurerm_resource_group" "rg_hcl" {
#   name     = "rg-hcl-test"
#   location = "central india"
# }


# Below code is for creating Resource Group using For_Each Meta Argument
resource "azurerm_resource_group" "rg_block_forEach" {
  for_each = var.vnet_hcl # har ek ke liye
  name     = "rg-${each.value.name}"
  location = each.value.location

}

# below code is for creating network security group 
resource "azurerm_network_security_group" "nsg_hcl" {
  depends_on          = [azurerm_resource_group.rg_block_forEach]
  for_each            = var.vnet_hcl
  name                = "nsg-${each.value.name}"
  location            = each.value.location
  resource_group_name = "rg-${each.value.name}"

  dynamic "security_rule" {
    for_each = each.value.security_rule
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

# below code is for creating virtual network
resource "azurerm_virtual_network" "vnet_block_forEach" {
  depends_on          = [azurerm_network_security_group.nsg_hcl]
  for_each            = var.vnet_hcl
  name                = "vnet-${each.value.name}"
  location            = each.value.location
  resource_group_name = "rg-${each.value.name}"
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  dynamic "subnet" {
    for_each = each.value.subnet
    content  {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
      security_group   = azurerm_network_security_group.nsg_hcl[each.key].id
    }
  }

  tags = {
    environment = "Test"
  }
}





