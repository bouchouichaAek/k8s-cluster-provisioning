<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name                                                                                                                          | Source            | Version |
| ----------------------------------------------------------------------------------------------------------------------------- | ----------------- | ------- |
| <a name="module_network"></a> [network](https://github.com/bouchouichaAek/k8s-cluster-provisioning/tree/main/modules/network) | ./modules/network | n/a     |
| <a name="module_vms"></a> [vms](https://github.com/bouchouichaAek/k8s-cluster-provisioning/tree/main/modules/vm)              | ./modules/vm      | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                                     | Description                                              | Type     | Default                               | Required |
| ------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------- | -------- | ------------------------------------- | :------: |
| <a name="input_address_prefixes"></a> [address_prefixes](#input_address_prefixes)                                        | The address prefixes for the subnets.                    | `list`   | <pre>[<br/> "10.1.1.0/24"<br/>]</pre> |    no    |
| <a name="input_address_space"></a> [address_space](#input_address_space)                                                 | The address space for the virtual network.               | `list`   | <pre>[<br/> "10.1.0.0/16"<br/>]</pre> |    no    |
| <a name="input_admin_username"></a> [admin_username](#input_admin_username)                                              | The admin username for the VM.                           | `string` | `"azureuser"`                         |    no    |
| <a name="input_allocation_method"></a> [allocation_method](#input_allocation_method)                                     | The allocation method for the public IP address.         | `string` | `"Static"`                            |    no    |
| <a name="input_caching"></a> [caching](#input_caching)                                                                   | The caching option for the OS disk.                      | `string` | `"ReadWrite"`                         |    no    |
| <a name="input_client_id"></a> [client_id](#input_client_id)                                                             | The client ID for the Azure service principal.           | `string` | n/a                                   |   yes    |
| <a name="input_client_secret"></a> [client_secret](#input_client_secret)                                                 | The client secret for the Azure service principal.       | `string` | n/a                                   |   yes    |
| <a name="input_create_option"></a> [create_option](#input_create_option)                                                 | The create option for the OS disk.                       | `string` | `"FromImage"`                         |    no    |
| <a name="input_delete_data_disks"></a> [delete_data_disks](#input_delete_data_disks)                                     | Whether to delete the data disks when the VM is deleted. | `bool`   | `true`                                |    no    |
| <a name="input_delete_os_disk"></a> [delete_os_disk](#input_delete_os_disk)                                              | Whether to delete the OS disk when the VM is deleted.    | `bool`   | `true`                                |    no    |
| <a name="input_image_version"></a> [image_version](#input_image_version)                                                 | The version of the VM image.                             | `string` | `"latest"`                            |    no    |
| <a name="input_location"></a> [location](#input_location)                                                                | The location where resources will be created.            | `string` | `"eastus"`                            |    no    |
| <a name="input_managed_disk_type"></a> [managed_disk_type](#input_managed_disk_type)                                     | The managed disk type for the OS disk.                   | `string` | `"Standard_LRS"`                      |    no    |
| <a name="input_offer"></a> [offer](#input_offer)                                                                         | The offer of the VM image.                               | `string` | `"UbuntuServer"`                      |    no    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                                                                      | The prefix used for naming resources.                    | `string` | `"k8s"`                               |    no    |
| <a name="input_private_ip_address_allocation"></a> [private_ip_address_allocation](#input_private_ip_address_allocation) | The allocation method for the private IP address.        | `string` | `"Dynamic"`                           |    no    |
| <a name="input_publisher"></a> [publisher](#input_publisher)                                                             | The publisher of the VM image.                           | `string` | `"Canonical"`                         |    no    |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name)                               | The name of the resource group.                          | `string` | `"k8s-rg"`                            |    no    |
| <a name="input_sku"></a> [sku](#input_sku)                                                                               | The SKU of the VM image.                                 | `string` | `"18.04-LTS"`                         |    no    |
| <a name="input_subnet_names"></a> [subnet_names](#input_subnet_names)                                                    | The names of the subnets.                                | `list`   | <pre>[<br/> "k8s-subnet"<br/>]</pre>  |    no    |
| <a name="input_subscription_id"></a> [subscription_id](#input_subscription_id)                                           | The subscription ID for the Azure account.               | `string` | n/a                                   |   yes    |
| <a name="input_tenant_id"></a> [tenant_id](#input_tenant_id)                                                             | The tenant ID for the Azure account.                     | `string` | n/a                                   |   yes    |
| <a name="input_vm_size"></a> [vm_size](#input_vm_size)                                                                   | The size of the virtual machine.                         | `string` | `"Standard_DS1_v2"`                   |    no    |

## Outputs

| Name                                                                                   | Description             |
| -------------------------------------------------------------------------------------- | ----------------------- |
| <a name="output_master_public_ip"></a> [master_public_ip](#output_master_public_ip)    | Master node Public IP   |
| <a name="output_worker_public_ips"></a> [worker_public_ips](#output_worker_public_ips) | Worker nodes Public IPs |

<!-- END_TF_DOCS -->
