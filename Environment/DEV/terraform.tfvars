# For each variables defined
rgName = {
  rg1 = {
    "name"     = "rg-hcl-dev"
    "location" = "west us"
  },
  rg2 = {
    "name"     = "rg-hcl-test"
    "location" = "central india"
  }
}

vnet_hcl = {
  v1 = {
    name          = "hcl-dev",
    address_space = ["10.0.0.0/16"],
    dns_servers   = ["10.0.0.4", "10.0.0.5"],
    location      = "central india"

    subnet = {
      subnet1 = {
        name             = "frontend"
        address_prefixes = ["10.0.1.0/24"]
        security_group   = "nsg-hcl-dev"
      }
      subnet2 = {
        name             = "backend"
        address_prefixes = ["10.0.2.0/24"]
        security_group   = "nsg-hcl-dev"
      }
    }
  },
  v2 = {
    name          = "hcl-test",
    address_space = ["10.0.0.0/16"],
    dns_servers   = ["10.0.0.4", "10.0.0.5"],
    location      = "west us"

    subnet = {
      subnet1 = {
        name             = "frontend"
        address_prefixes = ["10.0.1.0/24"]
        security_group   = "nsg-hcl-test"
      },
      subnet2 = {
        name             = "backend"
        address_prefixes = ["10.0.2.0/24"]
        security_group   = "nsg-hcl-test"
      }
    }
  }
}


nsg = {
  nsg1 = {
    name     = "nsg-hcl-dev"
    location = "central india"

    security_rule = {
      rule1 = {
        "name"                       = "rule1"
        "priority"                   = 100
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "*"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      },
      rule2 = {
        "name"                       = "rule2"
        "priority"                   = 200
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "*"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      }
    }
  },
  nsg2 = {
    name     = "nsg-hcl-test"
    location = "west us"
    security_rule = {
      rule1 = {
        "name"                       = "rule1"
        "priority"                   = 100
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "*"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      },
      rule2 = {
        "name"                       = "rule2"
        "priority"                   = 200
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "*"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      }
    }
  }
}
