module "network" {
  source              = "./modules/network"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  subnet_names        = var.subnet_names
  address_prefixes    = var.address_prefixes
}

module "vms" {
  source = "./modules/vm"
  # pass variables

  for_each                      = local.nodes
  node_name                     = each.key
  location                      = var.location
  resource_group_name           = var.resource_group_name
  private_ip_address_allocation = var.private_ip_address_allocation
  subnet_id                     = module.network.subnet_id
  vm_size                       = var.vm_size
  delete_os_disk                = var.delete_os_disk
  delete_data_disks             = var.delete_data_disks
  admin_username                = var.admin_username
  path_ssh                      = local.path_ssh
  key_data                      = local.key_data
  address_prefixes              = var.address_prefixes
  publisher                     = var.publisher
  offer                         = var.offer
  sku                           = var.sku
  image_version                 = var.image_version
  caching                       = var.caching
  create_option                 = var.create_option
  managed_disk_type             = var.managed_disk_type

  depends_on = [module.network]
}

