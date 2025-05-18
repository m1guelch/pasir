variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
  default     = "rg-pasir"
}

variable "location" {
  description = "Region for all resources"
  type        = string
  default     = "West Europe"
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vnet-pasir"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "subnet-pasir"
}

variable "nic_name" {
  description = "Network Interface name"
  type        = string
  default     = "nic-pasir"
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
  default     = "vm-pasir"
}

variable "vm_username" {
  description = "Username for the Virtual Machine user"
  type        = string
  default     = "m1guelch"
}

variable "ssh_public_key" {
  description = "Public SSH Key for the VM"
  type        = string
}

variable "vm_size" {
  description = "Virtual Machine size"
  type        = string
  default     = "Standard_B2s"
}

variable "os_image" {
  description = "Operating System image for the Virtual Machine"
  type        = string
  default     = "debian"
}

variable "os_version" {
  description = "Operating System version"
  type        = string
  default     = "12"
}
