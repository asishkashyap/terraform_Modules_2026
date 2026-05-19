
variable "rgName" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Name of the Resource Group"
}

variable "vnet_hcl" {
  type = map(object({
    name             = string
    address_space    = list(string)
    dns_servers      = list(string)
    location         = string

    subnet = map(object({
      name             = string
      address_prefixes = list(string)
      security_group   = string
    }))
  }))
  description = "Name of the Virtual Network"
}

variable "nsg" {
  type = map(object({
    name     = string
    location = string
    security_rule = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}