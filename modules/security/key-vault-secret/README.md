# Key Vault Secret

Key Vault secrets. Secret values can be stored in Terraform state; secure state access and avoid committing values.

## Usage

This module supports multiple instances through `for_each`. Pass a map to the module's primary input variable.

```hcl
module "key_vault_secret" {
  source = "../../modules/security/key-vault-secret"

  # Supply the required input map, for example:
  # "secrets" = {}
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
