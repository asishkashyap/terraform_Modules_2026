module "rg" {
  source = "../../Resource_Group"
  rgName = var.rgName
}


module "nsg" {
  depends_on    = [module.rg]
  source        = "../../NSG"
  nsg = var.nsg
}

module "vnet" {
  depends_on = [module.nsg]
  source     = "../../VNET"
  vnet_hcl   = var.vnet_hcl
}


