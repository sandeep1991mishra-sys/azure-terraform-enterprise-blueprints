
# Azure Virtual Network Module

## Purpose

Creates and manages one or more Azure Virtual Networks using Terraform's `for_each`.

## Features

- Creates multiple virtual networks through a single module.
- Supports configurable address spaces.
- Supports optional custom DNS server IPs.
- Supports optional resource tags.
- Reusable across different environments and projects.

## Inputs

| Name | Type | Required | Description |
|---|---|---|---|
| virtual_networks | map(object) | Yes | Map containing virtual network configurations. |
| name | string | Yes | Name of the virtual network. |
| resource_group_name | string | Yes | Name of the existing Azure Resource Group. |
| location | string | Yes | Azure region where the VNet will be created. |
| address_space | list(string) | Yes | IPv4 address ranges assigned to the VNet. |
| dns_servers | list(string) | No | Custom DNS server IP addresses. Defaults to an empty list. |
| tags | map(string) | No | Tags assigned to the VNet. Defaults to an empty map. |

## Outputs

| Name | Description |
|---|---|
| ids | Map of virtual network IDs. |
| names | Map of virtual network names. |
| address_spaces | Map of virtual network address spaces. |
| resource_group_names | Map of associated Resource Group names. |

## Requirements

- Terraform
- HashiCorp AzureRM provider
- An existing Azure Resource Group for each virtual network
- Appropriate Azure permissions

## Important Notes

- This module creates virtual networks only; it does not create Resource Groups.
- Resource Group names, regions, address spaces, DNS settings and tags are supplied by the caller.
- Ensure VNet address spaces do not conflict with connected networks.
- No environment-specific values are hardcoded in this module.
