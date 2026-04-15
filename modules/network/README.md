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
| [azurerm_network_security_group.k8s_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_subnet.k8s_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.k8s_subnet_nsg_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.k8s_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The address prefixes for the subnets. | `list` | <pre>[<br/>  "10.1.1.0/24"<br/>]</pre> | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space for the virtual network. | `list` | <pre>[<br/>  "10.1.0.0/16"<br/>]</pre> | no |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | The allocation method for the public IP address. | `string` | `"Static"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where resources will be created. | `string` | `"eastus"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix used for naming resources. | `string` | `"k8s"` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | The allocation method for the private IP address. | `string` | `"Dynamic"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `string` | `"k8s-rg"` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | The names of the subnets. | `list` | <pre>[<br/>  "k8s-subnet"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the k8s subnet |
<!-- END_TF_DOCS -->