# Create the Resource Group
resource "azurerm_resource_group" "my_resource_group" {
  name     = var.resource_group_name
  location = var.location
}

# Create the Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

# Create the Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.vm_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  # Create a security rule to allow SSH access
  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create the Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create the public IP address that will be associated with the VM
resource "azurerm_public_ip" "vm_public_ip" {
  name                = "public-ip-${var.vm_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Create the Network Interface
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  # Create the IP configuration for the NIC
  ip_configuration {
    name                          = "ipconfig-${var.vm_name}"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }
}

# Associate the Network Security Group with the Network Interface
resource "azurerm_network_interface_security_group_association" "nsg_association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create the Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic.id]

  # Create the OS disk
  os_disk {
    name                 = "osdisk-${var.vm_name}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Specify the image reference for the VM
  source_image_reference {
    publisher = var.os_image
    offer     = "${var.os_image}-${var.os_version}"
    sku       = var.os_version
    version   = "latest"
  }

  # Specify the VM credentials
  admin_username                  = var.vm_username
  disable_password_authentication = true

  # Specify the SSH public key for authentication
  admin_ssh_key {
    username   = var.vm_username
    public_key = file("~/.ssh/id_rsa.pub")
  }
}
