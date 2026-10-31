# Backup Policy Vm

Daily-retention VM backup policies; extend retention blocks to match your compliance policy.

## Usage

This module supports multiple instances through `for_each`. Pass a map to the module's primary input variable.

```hcl
module "backup_policy_vm" {
  source = "../../modules/backup-disaster-recovery/backup-policy-vm"

  # Supply the required input map, for example:
  # "policies" = {}
}
```

## Files

- `main.tf` — Azure resource declaration.
- `variables.tf` — Typed inputs; no client-specific values are hard-coded.
- `outputs.tf` — Resource IDs and useful attributes.

## Notes

- Configure the `azurerm` provider in the calling root module.
- Review provider-version compatibility and required Azure permissions before use.
- Do not commit credentials or secret values. Terraform state can contain sensitive data.
- Run `terraform fmt -recursive`, `terraform init`, and `terraform validate` in a test root module before production use.
