module "resource_group" {

  source = "../modules/azurerm_resource_group"

  rgs = var.rgs

}

module "virtual_network" {

  source = "../modules/azurerm_virtual_network"

  depends_on = [
    module.resource_group
  ]

  vnets = var.vnets

}

module "subnets" {

  source = "../modules/azurerm_subnet"

  depends_on = [
    module.virtual_network
  ]

  subnets = var.subnets

}

module "public_ip" {

  source = "../modules/azurerm_public_ip"

  depends_on = [
    module.resource_group
  ]

  public_ips = var.public_ips

}

module "nic" {

  source = "../modules/azurerm_network_interface"

  depends_on = [
    module.subnets,
    module.public_ip
  ]

  nics = var.nics

  subnet_ids = module.subnets.subnet_ids

  public_ip_ids = module.public_ip.public_ip_ids

}

module "vm" {

  source = "../modules/azurerm_virtual_machine"

  depends_on = [
    module.nic
  ]

  vms = var.vms

  nic_ids = module.nic.nic_ids

}