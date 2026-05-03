name = ["dev", "prod"] # Terraform reads index valuse with 0,1,2,3......[0]
#         0       1       2

location = ["central india", "east us"]


# For each variables defined
rgName = {
  rg1 = {
    "name"     = "rg-hcl-dev"
    "location" = "west us"
  },
  rg2 = {
    "name"     = "rg--hcl-test"
    "location" = "central india"
  },
  rg3 = {
    "name"     = "rg-hcl-prod"
    "location" = "central india"
  }
}
