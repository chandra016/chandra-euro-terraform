#Creating azure virtual machie of linux type
resource "azurerm_linux_virtual_machine" "Chandra-vm1" {
    name = "chandra-linux-vm1"
    resource_group_name = data.azurerm_resource_group.Chandra_resource_1.name
    location = data.azurerm_resource_group.Chandra_resource_1.location
    admin_username = "chandra"
    admin_password = "chandra@123"
    disable_password_authentication = false
    network_interface_ids = [azurerm_network_interface.chandra-nic1.id]
    size = "Standard_L8as_v3"  
    #copied 
      os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  #till this
}