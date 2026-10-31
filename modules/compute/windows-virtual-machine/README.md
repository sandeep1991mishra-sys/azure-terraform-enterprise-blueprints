# windows-virtual-machine

Reusable Terraform module for Azure resource type $(System.Collections.Hashtable.resource).

## Input

The module accepts a map named esources. Each map entry defines one resource instance.

## Example

``hcl
module "example" {
  source = "../../modules/compute/windows-virtual-machine"

  resources = {
    example1 = {
      # Fill in the required attributes from variables.tf
    }
  }
}
``

## Outputs

- ids: resource IDs
- 
ames: resource names

Review required arguments and AzureRM provider compatibility before deployment.
