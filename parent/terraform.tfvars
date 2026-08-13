rgs = {

  rg1 = {

    name     = "suraj_rg"
    location = "centralindia"

  }

}

vnets = {

  vnet1 = {

    name                = "suraj_vnet"
    location            = "centralindia"
    resource_group_name = "suraj_rg"
    address_space       = ["10.0.0.0/16"]

  }

}

subnets = {

  snet1 = {

    name                 = "suraj_subnet"
    resource_group_name  = "suraj_rg"
    virtual_network_name = "suraj_vnet"
    address_prefixes     = ["10.0.1.0/24"]

  }

}
public_ips = {

  vm1 = {

    public_ip_name      = "suraj-pip"
    resource_group_name = "suraj_rg"
    location            = "centralindia"
    allocation_method   = "Static"

  }

}
nics = {

  vm1 = {

    nic_name = "suraj-nic"

    rg_name = "suraj_rg"

    location = "centralindia"

    subnet_name = "suraj_subnet"

    vnet_name     = "suraj_vnet"
    public_ip_key = "pip1"
  }

}

vms = {

  vm1 = {

    vm_name  = "suraj-vm"
    rg_name  = "suraj_rg"
    location = "centralindia"

    vm_size = "Standard_D2s_v3"

    admin_username = "azureuser"
    admin_password = "Admin@1234"

    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"

  }

}