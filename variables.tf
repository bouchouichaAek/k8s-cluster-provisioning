variable "subscription_id" {
  description = "The subscription ID for the Azure account."
  type        = string

}

variable "tenant_id" {
  description = "The tenant ID for the Azure account."
  type        = string
}

variable "client_id" {
  description = "The client ID for the Azure service principal."
  type        = string
}

variable "client_secret" {
  description = "The client secret for the Azure service principal."
  type        = string
}

variable "prefix" {
  description = "The prefix used for naming resources."
  default     = "k8s"
}

variable "location" {
  description = "The location where resources will be created."
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  default     = "k8s-rg"
}

variable "address_space" {
  description = "The address space for the virtual network."
  default     = ["10.1.0.0/16"]
}

variable "subnet_names" {
  description = "The names of the subnets."
  default     = ["k8s-subnet"]
}
variable "address_prefixes" {
  description = "The address prefixes for the subnets."
  default     = ["10.1.1.0/24"]
}

variable "allocation_method" {
  description = "The allocation method for the public IP address."
  default     = "Static"
}

variable "private_ip_address_allocation" {
  description = "The allocation method for the private IP address."
  default     = "Dynamic"
}

variable "delete_os_disk" {
  description = "Whether to delete the OS disk when the VM is deleted."
  default     = true
}

variable "delete_data_disks" {
  description = "Whether to delete the data disks when the VM is deleted."
  default     = true
}

variable "vm_size" {
  description = "The size of the virtual machine."
  default     = "Standard_DS1_v2"
}

variable "publisher" {
  description = "The publisher of the VM image."
  default     = "Canonical"
}

variable "offer" {
  description = "The offer of the VM image."
  default     = "UbuntuServer"
}

variable "sku" {
  description = "The SKU of the VM image."
  default     = "18.04-LTS"
}
variable "image_version" {
  description = "The version of the VM image."
  default     = "latest"
}

variable "caching" {
  description = "The caching option for the OS disk."
  default     = "ReadWrite"
}

variable "create_option" {
  description = "The create option for the OS disk."
  default     = "FromImage"
}

variable "managed_disk_type" {
  description = "The managed disk type for the OS disk."
  default     = "Standard_LRS"
}

variable "admin_username" {
  description = "The admin username for the VM."
  default     = "azureuser"
}
variable "ssh_key_path" {
  description = "The path to the SSH public key."
  default     = "~/.ssh/id_rsa.pub"
}
