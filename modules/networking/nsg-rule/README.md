# Azure Network Security Rule Module

## Purpose

Creates and manages Azure Network Security Group rules using Terraform's `for_each`.

## Features

- Supports multiple security rules through a single module.
- Supports inbound and outbound traffic rules.
- Configurable priority, direction, access and protocol.
- Supports multiple source and destination ports.
- Supports multiple source and destination address prefixes.
- Provides rule IDs, names, priorities and associated NSG names through outputs.

## Inputs

| Name | Type | Required | Description |
|---|---|---|---|
| nsg_rules | map(object) | Yes | Map containing security rule configurations. |
| name | string | Yes | Name of the security rule. |
| resource_group_name | string | Yes | Name of the existing Resource Group. |
| network_security_group_name | string | Yes | Name of the existing NSG. |
| priority | number | Yes | Rule priority from 100 to 4096; unique within the NSG. |
| direction | string | Yes | Inbound or Outbound. |
| access | string | Yes | Allow or Deny. |
| protocol | string | Yes | Tcp, Udp, Icmp or *. |
| source_port_ranges | list(string) | No | Source ports; defaults to ["*"]. |
| destination_port_ranges | list(string) | No | Destination ports; defaults to ["*"]. |
| source_address_prefixes | list(string) | No | Source address prefixes; defaults to ["*"]. |
| destination_address_prefixes | list(string) | No | Destination address prefixes; defaults to ["*"]. |
| description | string | No | Optional rule description. |

## Outputs

| Name | Description |
|---|---|
| ids | Map of security rule IDs. |
| names | Map of security rule names. |
| priorities | Map of security rule priorities. |
| network_security_group_names | Map of associated NSG names. |

## Requirements

- Terraform
- HashiCorp AzureRM provider
- An existing Resource Group and Network Security Group
- Appropriate Azure permissions

## Important Notes

- This module creates security rules only; it does not create NSGs.
- Rule priorities must be unique within the same NSG.
- Valid priority values are 100 through 4096.
- Avoid overly broad rules; follow the principle of least privilege.
- The module uses plural port and address-prefix arguments.
- Do not specify singular and plural forms of the same port or address field together.
- No client-specific values are hardcoded in this module.
