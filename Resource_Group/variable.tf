variable "name" {
  type        = list(string)
  description = "Name of the resource group"

}

variable "location" {
  type        = list(string)
}


variable "rgName" {
  type        = map(object({
    name     = string
    location = string
  }))
  description = "Name of the Resource Group"
}
