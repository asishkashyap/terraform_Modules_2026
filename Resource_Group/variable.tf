variable "name" {
  type        = list(string)
  description = "Name of the resource group"

}

variable "location" {
  type = list(string)
}


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
    sub_name         = string
    address_prefixes = list(string)
    location         = string
  }))
  description = "Name of the Virtual Network"
}
