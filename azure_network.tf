
#creating azure network
resource "azurerm_virtual_network" "chandra-network1" {
    resource_group_name = data.azurerm_resource_group.Chandra_resource_1.name
    location = data.azurerm_resource_group.Chandra_resource_1.location
    name = "chandra-network1"
    address_space = ["10.0.0.0/16"]

}
#creating subnet
 resource "azurerm_subnet" "chandra-subnet1" {
    name = "chandra-internal-subnet"
    virtual_network_name = azurerm_virtual_network.chandra-network1.name
    resource_group_name = data.azurerm_resource_group.Chandra_resource_1.name
    address_prefixes = ["10.0.1.0/24"]
}
resource "azurerm_network_interface" "chandra-nic1" {
    name = "chandra-network-interface"
    resource_group_name = data.azurerm_resource_group.Chandra_resource_1.name
    location = data.azurerm_resource_group.Chandra_resource_1.location

    ip_configuration {
        subnet_id = azurerm_subnet.chandra-subnet1.id
        private_ip_address_allocation = "Dynamic"
        name ="chandra-ip1"
      
    }
}
#Creating public IP 
resource "azurerm_public_ip" "chandra-public-ip1" {
    name = "chandrapub-ip1"
    resource_group_name = data.azurerm_resource_group.Chandra_resource_1.name
    location = data.azurerm_resource_group.Chandra_resource_1.location
    allocation_method = "Static"
  
}