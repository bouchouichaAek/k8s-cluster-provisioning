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

