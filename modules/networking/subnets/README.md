
# Azure Subnet Module

## Purpose

Creates and manages multiple Azure subnets using Terraform's `for_each`.

## Features

- Creates multiple subnets through a single module.
- Supports configurable address prefixes.
- Can be reused across different projects and environments.
- Exposes subnet IDs and other useful subnet details through outputs.

## Inputs

| Name | Type | Required | Description |
|---|---|---|---|
| subnets | map(object) | Yes | Map containing subnet configurations. |
| name | string | Yes | Name of the subnet. |
| resource_group_name | string | Yes | Name of the existing Resource Group. |
| virtual_network_name | string | Yes | Name of the existing Virtual Network. |
| address_prefixes | list(string) | Yes | IP address ranges assigned to the subnet. |

## Outputs

| Name | Description |
|---|---|
| ids | Map of subnet IDs. |
| names | Map of subnet names. |
| address_prefixes | Map of subnet address prefixes. |
| virtual_network_names | Map of parent Virtual Network names. |

## Requirements

- Terraform
- HashiCorp AzureRM provider
- An existing Resource Group and Virtual Network for each subnet
- Appropriate Azure permissions

## Important Notes

- This module creates subnets only.
- It does not create Resource Groups or Virtual Networks.
- Each subnet's address prefixes must fit within the parent VNet address space.
- Subnet address ranges must not overlap with other subnets in the same VNet.
- No environment-specific values are hardcoded in this module.
