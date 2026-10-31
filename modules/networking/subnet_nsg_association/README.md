
# Azure Subnet–NSG Association Module

## Purpose

Associates existing Azure subnets with existing Network Security Groups (NSGs) using Terraform's `for_each`.

## Features

- Supports multiple subnet-to-NSG associations.
- Uses subnet and NSG resource IDs as inputs.
- Exposes association IDs and related resource IDs through outputs.
- Can be reused across projects and environments.

## Inputs

| Name | Type | Required | Description |
|---|---|---|---|
| subnet_nsg_associations | map(object) | Yes | Map containing subnet-to-NSG association configurations. |
| subnet_id | string | Yes | Azure resource ID of the existing subnet. |
| network_security_group_id | string | Yes | Azure resource ID of the existing NSG. |

## Outputs

| Name | Description |
|---|---|
| ids | Map of association resource IDs. |
| subnet_ids | Map of associated subnet IDs. |
| network_security_group_ids | Map of associated NSG IDs. |

## Requirements

- Terraform
- HashiCorp AzureRM provider
- Existing Azure subnets and Network Security Groups
- Appropriate Azure permissions

## Important Notes

- This module creates associations only; it does not create subnets or NSGs.
- A subnet can have only one NSG association at a time.
- Changing an existing association can replace the association with another NSG.
- Use subnet and NSG IDs from the respective module outputs where possible.
- No client-specific resource IDs are hardcoded in this module.
