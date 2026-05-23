variable "vnet_hcl" {
  type = map(object({
    name          = string
    address_space = list(string)
    dns_servers   = list(string)
    location      = string

    subnet = map(object({
      name             = string
      address_prefixes = list(string)
      security_group   = string
    }))
  }))
  description = "Name of the Virtual Network"
}
