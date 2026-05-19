# below code is for creating virtual network
resource "azurerm_virtual_network" "vnet_block_forEach" {
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