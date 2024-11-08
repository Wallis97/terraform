resource "azurerm_resource_group" "kubernetes_cluster_rg" {
  name = var.rg_name
  location = var.location
}

resource "azurerm_virtual_network" "k8s_vnet" {
  name = var.vnet_name
  address_space = var.address_space
  location = azurerm_resource_group.kubernetes_cluster_rg.location
  resource_group_name = azurerm_resource_group.kubernetes_cluster_rg.name
}

resource "azurerm_subnet" "k8s_subnet" {
  name = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name = var.rg_name
  address_prefixes = var.address_prefixes
}

resource "azurerm_network_interface" "node_nic" {
  name = var.nic_name
  location = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name = var.ip_config_name
    subnet_id = var.subnet_name
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "name" {
  name = var.vm_name
  resource_group_name = var.rg_name
  location = var.location
  size = var.vm_size
  admin_username = var.username
  network_interface_ids = [
    
  ]
}