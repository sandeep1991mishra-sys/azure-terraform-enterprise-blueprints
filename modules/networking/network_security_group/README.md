
# Azure Network Security Group Module

## Purpose

Creates and manages multiple Azure Network Security Groups (NSGs) using Terraform's `for_each`.

## Features

- Creates multiple NSGs through a single module.
- Supports configurable names and Azure regions.
- Supports optional resource tags.
- Exposes NSG IDs and resource details through outputs.
- Can be reused across different projects and environments.

## Inputs

| Name | Type | Required | Description |
|---|---|---|---|
| network_security_groups | map(object) | Yes | Map containing NSG configurations. |
| name | string | Yes | Name of the Network Security Group. |
| resource_group_name | string | Yes | Name of the existing Resource Group. |
| location | string | Yes | Azure region where the NSG will be created. |
| tags | map(string) | No | Resource tags. Defaults to an empty map. |

## Outputs

| Name | Description |
|---|---|
| ids | Map of NSG resource IDs. |
| names | Map of NSG names. |
| locations | Map of NSG Azure regions. |
| resource_group_names | Map of associated Resource Group names. |

## Requirements

- Terraform
- HashiCorp AzureRM provider
- An existing Resource Group for each NSG
- Appropriate Azure permissions

## Important Notes

- This module creates NSGs only; it does not create security rules.
- Security rules are managed separately by the NSG rule module.
- Subnet and network interface associations are managed separately.
- No client-specific values are hardcoded in this module.
