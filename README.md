<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_vms"></a> [vms](#module\_vms) | ./modules/vm | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The address prefixes for the subnets. | `list` | <pre>[<br/>  "10.1.1.0/24"<br/>]</pre> | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space for the virtual network. | `list` | <pre>[<br/>  "10.1.0.0/16"<br/>]</pre> | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The admin username for the VM. | `string` | `"azureuser"` | no |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | The allocation method for the public IP address. | `string` | `"Static"` | no |
| <a name="input_caching"></a> [caching](#input\_caching) | The caching option for the OS disk. | `string` | `"ReadWrite"` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client ID for the Azure service principal. | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret for the Azure service principal. | `string` | n/a | yes |
| <a name="input_create_option"></a> [create\_option](#input\_create\_option) | The create option for the OS disk. | `string` | `"FromImage"` | no |
| <a name="input_delete_data_disks"></a> [delete\_data\_disks](#input\_delete\_data\_disks) | Whether to delete the data disks when the VM is deleted. | `bool` | `true` | no |
| <a name="input_delete_os_disk"></a> [delete\_os\_disk](#input\_delete\_os\_disk) | Whether to delete the OS disk when the VM is deleted. | `bool` | `true` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | The version of the VM image. | `string` | `"latest"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where resources will be created. | `string` | `"eastus"` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | The managed disk type for the OS disk. | `string` | `"Standard_LRS"` | no |
| <a name="input_offer"></a> [offer](#input\_offer) | The offer of the VM image. | `string` | `"UbuntuServer"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix used for naming resources. | `string` | `"k8s"` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | The allocation method for the private IP address. | `string` | `"Dynamic"` | no |
| <a name="input_publisher"></a> [publisher](#input\_publisher) | The publisher of the VM image. | `string` | `"Canonical"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `string` | `"k8s-rg"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the VM image. | `string` | `"18.04-LTS"` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | The names of the subnets. | `list` | <pre>[<br/>  "k8s-subnet"<br/>]</pre> | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription ID for the Azure account. | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The tenant ID for the Azure account. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the virtual machine. | `string` | `"Standard_DS1_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_master_public_ip"></a> [master\_public\_ip](#output\_master\_public\_ip) | Master node Public IP |
| <a name="output_worker_public_ips"></a> [worker\_public\_ips](#output\_worker\_public\_ips) | Worker nodes Public IPs |
<!-- END_TF_DOCS -->