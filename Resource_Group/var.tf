
variable "rgName" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Name of the Resource Group"
}