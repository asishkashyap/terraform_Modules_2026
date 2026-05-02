variable "env" {                # Declared a Variable here for ENV
  type        = string
  description = "Environment to be used for the resource group name"
  default     = "dev"
}

variable "name" {
  type        = string
  description = "Name of the resource group"
  default     = "BlueStarDev1"
}