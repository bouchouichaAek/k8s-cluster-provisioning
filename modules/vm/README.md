<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                   | Type     |
| -------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_network_interface.k8s_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_public_ip.k8s_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)           | resource |
| [azurerm_virtual_machine.k8s_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine)      | resource |

## Inputs

| Name                                                                                                                     | Description                                              | Type     | Default                               | Required |
| ------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------- | -------- | ------------------------------------- | :------: |
| <a name="input_address_prefixes"></a> [address_prefixes](#input_address_prefixes)                                        | The address prefixes for the subnets.                    | `list`   | <pre>[<br/> "10.1.1.0/24"<br/>]</pre> |    no    |
| <a name="input_address_space"></a> [address_space](#input_address_space)                                                 | The address space for the virtual network.               | `list`   | <pre>[<br/> "10.1.0.0/16"<br/>]</pre> |    no    |
| <a name="input_admin_username"></a> [admin_username](#input_admin_username)                                              | The admin username for the VM.                           | `string` | `"azureuser"`                         |    no    |
| <a name="input_allocation_method"></a> [allocation_method](#input_allocation_method)                                     | The allocation method for the public IP address.         | `string` | `"Static"`                            |    no    |
| <a name="input_caching"></a> [caching](#input_caching)                                                                   | The caching option for the OS disk.                      | `string` | `"ReadWrite"`                         |    no    |
| <a name="input_create_option"></a> [create_option](#input_create_option)                                                 | The create option for the OS disk.                       | `string` | `"FromImage"`                         |    no    |
| <a name="input_delete_data_disks"></a> [delete_data_disks](#input_delete_data_disks)                                     | Whether to delete the data disks when the VM is deleted. | `bool`   | `true`                                |    no    |
| <a name="input_delete_os_disk"></a> [delete_os_disk](#input_delete_os_disk)                                              | Whether to delete the OS disk when the VM is deleted.    | `bool`   | `true`                                |    no    |
| <a name="input_image_version"></a> [image_version](#input_image_version)                                                 | The version of the VM image.                             | `string` | `"latest"`                            |    no    |
| <a name="input_key_data"></a> [key_data](#input_key_data)                                                                | The SSH public key data.                                 | `any`    | n/a                                   |   yes    |
| <a name="input_location"></a> [location](#input_location)                                                                | The location where resources will be created.            | `string` | `"eastus"`                            |    no    |
| <a name="input_managed_disk_type"></a> [managed_disk_type](#input_managed_disk_type)                                     | The managed disk type for the OS disk.                   | `string` | `"Standard_LRS"`                      |    no    |
| <a name="input_node_name"></a> [node_name](#input_node_name)                                                             | The name of the VM.                                      | `any`    | n/a                                   |   yes    |
| <a name="input_offer"></a> [offer](#input_offer)                                                                         | The offer of the VM image.                               | `string` | `"UbuntuServer"`                      |    no    |
| <a name="input_path_ssh"></a> [path_ssh](#input_path_ssh)                                                                | The path to the SSH public key.                          | `any`    | n/a                                   |   yes    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                                                                      | The prefix used for naming resources.                    | `string` | `"k8s"`                               |    no    |
| <a name="input_private_ip_address_allocation"></a> [private_ip_address_allocation](#input_private_ip_address_allocation) | The allocation method for the private IP address.        | `string` | `"Dynamic"`                           |    no    |
| <a name="input_publisher"></a> [publisher](#input_publisher)                                                             | The publisher of the VM image.                           | `string` | `"Canonical"`                         |    no    |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name)                               | The name of the resource group.                          | `string` | `"k8s-rg"`                            |    no    |
| <a name="input_sku"></a> [sku](#input_sku)                                                                               | The SKU of the VM image.                                 | `string` | `"18.04-LTS"`                         |    no    |
| <a name="input_subnet_id"></a> [subnet_id](#input_subnet_id)                                                             | The ID of the subnet where the node will be deployed.    | `string` | n/a                                   |   yes    |
| <a name="input_subnet_names"></a> [subnet_names](#input_subnet_names)                                                    | The names of the subnets.                                | `list`   | <pre>[<br/> "k8s-subnet"<br/>]</pre>  |    no    |
| <a name="input_vm_size"></a> [vm_size](#input_vm_size)                                                                   | The size of the virtual machine.                         | `string` | `"Standard_DS1_v2"`                   |    no    |

## Outputs

| Name                                                           | Description         |
| -------------------------------------------------------------- | ------------------- |
| <a name="output_public_ip"></a> [public_ip](#output_public_ip) | Public IP of the VM |

<!-- END_TF_DOCS -->
