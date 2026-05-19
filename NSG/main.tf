# below code is for creating network security group 
resource "azurerm_network_security_group" "nsg_hcl" {
  for_each            = var.nsg
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