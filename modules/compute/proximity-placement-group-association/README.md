# Proximity Placement Group Association

## Purpose
Documentation for associating an Azure VM with an existing Proximity Placement Group.

## Implementation
AzureRM v5.12.0 does not support a standalone PPG association resource.
Configure proximity_placement_group_id directly inside the VM resource.

## Example
proximity_placement_group_id = var.proximity_placement_group_id

## Important
- The PPG must already exist.
- The VM must be compatible with the PPG.
- Association is managed through the VM resource.
- This module does not deploy Azure resources.
