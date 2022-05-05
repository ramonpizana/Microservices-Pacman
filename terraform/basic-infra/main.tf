module "rg" {
  source = "./modules/rg"
}

# Azure Container Registry 
module "azureregistry" {
  source         = "./modules/acr"
  resource_group = module.rg.resource_group
  location       = module.rg.location
}

# Cluster Kubernetes
module "cluster" {
  source              = "./modules/cluster"
  resource_group      = module.rg.resource_group
  location            = module.rg.location
}

# Network
module "network" {
  source               = "./modules/network"
  address_space        = var.address_space
  location             = module.rg.location
  virtual_network_name = var.virtual_network_name
  application_type     = var.application_type
  resource_type        = "NET"
  resource_group       = module.rg.resource_group
  address_prefix_range = var.address_prefix_range
}

# Network security group
module "nsg" {
  source               = "./modules/nsg"
  location             = module.rg.location
  application_type     = var.application_type
  resource_type        = "NSG"
  resource_group       = module.rg.resource_group
  subnet_id            = module.network.subnet_id
  address_prefix_range = var.address_prefix_range
}

#Public IP
module "publicip" {
  source           = "./modules/publicip"
  location         = module.rg.location
  application_type = var.application_type
  resource_type    = "publicip"
  resource_group   = module.rg.resource_group
}

#Virtual Machine
module "vm" {
  source               = "./modules/vm"
  location             = module.rg.location
  application_type     = var.application_type
  resource_type        = "VM"
  resource_group       = module.rg.resource_group
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.publicip.public_ip_address_id
}
