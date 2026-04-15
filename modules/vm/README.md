<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface.k8s_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_public_ip.k8s_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_virtual_machine.k8s_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The address prefixes for the subnets. | `list` | <pre>[<br/>  "10.1.1.0/24"<br/>]</pre> | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space for the virtual network. | `list` | <pre>[<br/>  "10.1.0.0/16"<br/>]</pre> | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The admin username for the VM. | `string` | `"azureuser"` | no |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | The allocation method for the public IP address. | `string` | `"Static"` | no |
| <a name="input_caching"></a> [caching](#input\_caching) | The caching option for the OS disk. | `string` | `"ReadWrite"` | no |
| <a name="input_create_option"></a> [create\_option](#input\_create\_option) | The create option for the OS disk. | `string` | `"FromImage"` | no |
| <a name="input_delete_data_disks"></a> [delete\_data\_disks](#input\_delete\_data\_disks) | Whether to delete the data disks when the VM is deleted. | `bool` | `true` | no |
| <a name="input_delete_os_disk"></a> [delete\_os\_disk](#input\_delete\_os\_disk) | Whether to delete the OS disk when the VM is deleted. | `bool` | `true` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | The version of the VM image. | `string` | `"latest"` | no |
| <a name="input_key_data"></a> [key\_data](#input\_key\_data) | The SSH public key data. | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location where resources will be created. | `string` | `"eastus"` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | The managed disk type for the OS disk. | `string` | `"Standard_LRS"` | no |
| <a name="input_node_name"></a> [node\_name](#input\_node\_name) | The name of the VM. | `any` | n/a | yes |
| <a name="input_offer"></a> [offer](#input\_offer) | The offer of the VM image. | `string` | `"UbuntuServer"` | no |
| <a name="input_path_ssh"></a> [path\_ssh](#input\_path\_ssh) | The path to the SSH public key. | `any` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix used for naming resources. | `string` | `"k8s"` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | The allocation method for the private IP address. | `string` | `"Dynamic"` | no |
| <a name="input_publisher"></a> [publisher](#input\_publisher) | The publisher of the VM image. | `string` | `"Canonical"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `string` | `"k8s-rg"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the VM image. | `string` | `"18.04-LTS"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet where the master node will be deployed. | `string` | n/a | yes |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | The names of the subnets. | `list` | <pre>[<br/>  "k8s-subnet"<br/>]</pre> | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the virtual machine. | `string` | `"Standard_DS1_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IP of the VM |
<!-- END_TF_DOCS -->