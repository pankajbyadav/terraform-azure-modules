resource "azurerm_linux_virtual_machine" "vm" {

  for_each = var.vms

  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location

  size = each.value.vm_size

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    var.nic_ids[each.key]
  ]

  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Standard_LRS"

  }

  source_image_reference {

    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version

  }

}