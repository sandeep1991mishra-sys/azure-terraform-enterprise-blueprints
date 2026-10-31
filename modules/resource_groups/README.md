
# Azure Resource Groups Module

## Purpose
Creates one or more Azure Resource Groups using for_each.

## Inputs
- `resource_groups`: Map of resource group configurations.
- `resource_group_name`: Azure resource group name within each map entry.
- `location`: Azure region within each map entry.
- `tags`: Optional resource tags.

## Outputs
- `ids`: Map of resource group IDs.
- `names`: Map of resource group names.
- `locations`: Map of resource group locations.

## Requirements
- Terraform
- HashiCorp AzureRM provider
- Appropriate Azure permissions

## Usage
Call this module from a root Terraform configuration
and supply the required input map.
