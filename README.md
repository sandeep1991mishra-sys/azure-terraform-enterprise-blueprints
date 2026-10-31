# Azure Terraform Enterprise Blueprints



**Reusable Azure Infrastructure Modules | Terraform | Infrastructure as Code**



A collection of reusable, modular Terraform building blocks for provisioning and managing Microsoft Azure infrastructure.



This repository is designed to help cloud engineers, DevOps engineers, and platform teams build consistent Azure infrastructure by reusing standardized Terraform modules across different projects and environments.



## Project Overview



The goal of this project is to provide reusable Azure infrastructure modules that reduce repetitive configuration, improve consistency, and make infrastructure code easier to maintain.



Each Terraform module follows a consistent structure:



- `main.tf` – Azure resource definitions.

- `variables.tf` – Configurable input variables.

- `outputs.tf` – Exported resource attributes.

- `README.md` – Module documentation and usage information.



Modules use Terraform `for_each` wherever applicable to support multiple resource instances through map-based inputs.



## Project Highlights



- 94 reusable Terraform modules.

- 11 Azure service categories.

- Modular and configurable infrastructure definitions.

- Consistent module structure and documentation.

- Reusable resource configurations using `for_each`.

- No environment-specific resource names hardcoded into module interfaces.

- Terraform initialization and configuration validation completed.

- Azure resources are not deployed as part of the validation process.



## Module Categories



| Category | Modules |

|---|---:|

| Networking | 36 |

| Compute | 19 |

| Application Services | 6 |

| Databases | 5 |

| DNS Server | 5 |

| Monitoring | 5 |

| Storage Accounts | 5 |

| Backup \& Disaster Recovery | 4 |

| Identity | 4 |

| Security | 4 |

| Resource Groups | 1 |

| **Total** | **94** |



### Infrastructure Coverage



**Networking**

Virtual Networks, Subnets, VNet Peering, Network Security Groups, Application Gateway, Azure Firewall, VPN Gateway, ExpressRoute, Private Endpoints, Load Balancer, NAT Gateway, and other networking components.



**Compute**

Linux and Windows Virtual Machines, Virtual Machine Scale Sets, Managed Disks, Availability Sets, Dedicated Hosts, Shared Image Gallery, VM Extensions, and related components.



**Application Services**

App Service Plans, Linux and Windows Web Apps, Linux Function Apps, Container App Environments, and App Configuration.



**Databases**

Azure SQL Server and Database, Cosmos DB, MySQL Flexible Server, and PostgreSQL Flexible Server.



**DNS**

DNS Zones, A Records, CNAME Records, Private DNS Zones, and Private DNS VNet Links.



**Identity and Security**

Managed Identities, Role Assignments, Custom Roles, Federated Identity Credentials, Key Vault, and Network Security Perimeter.



**Monitoring, Storage and Backup**

Log Analytics, Application Insights, Metric Alerts, Storage Accounts, Blob Containers, File Shares, Recovery Services Vaults, and Backup Policies.



For the complete list, see \[MODULE-INVENTORY.md](MODULE-INVENTORY.md).



## Repository Structure



```text

azure-terraform-enterprise-blueprints/

│

├── modules/

│   ├── application-services/

│   ├── backup-disaster-recovery/

│   ├── compute/

│   ├── databases/

│   ├── dns_server/

│   ├── identity/

│   ├── monitoring/

│   ├── networking/

│   ├── resource_groups/

│   ├── security/

│   └── storage_accounts/

│

├── docs/

│   └── validation/

│       └── final-validation-summary.md

│

├── scripts/

│   ├── complete-compute-code.ps1

│   ├── complete-compute-modules.ps1

│   ├── complete-networking-modules.ps1

│   ├── final-validation.ps1

│   ├── generate-networking-modules.ps1

│   └── repair-all-modules.ps1

│

├── MODULE-INVENTORY.md

├── README.md

├── LICENSE

└── .gitignore

```



## Prerequisites



- Terraform CLI (tested with Terraform v1.14.7).

- Microsoft Azure subscription.

- Azure CLI or another supported Azure authentication method.

- Appropriate Azure permissions.

- HashiCorp AzureRM provider (modules validated with v5.12.0).



The consuming Terraform configuration should declare its own provider requirements and authentication configuration.



## Getting Started



Clone the repository:



```bash

git clone https://github.com/sandeep1991mishra-sys/azure-terraform-enterprise-blueprints.git



cd azure-terraform-enterprise-blueprints

```



Select the module you want to reuse and reference it from your own Terraform root configuration.



### Example: Resource Groups Module



The following example demonstrates creating multiple Azure Resource Groups through one reusable module.



**main.tf**



```hcl

terraform {

&#x20; required_providers {

&#x20;   azurerm = {

&#x20;     source = "hashicorp/azurerm"

&#x20;   }

&#x20; }

}



provider "azurerm" {

&#x20; features {}

}



module "resource_groups" {

&#x20; source = "./modules/resource_groups"



&#x20; resource_groups = {

&#x20;   application = {

&#x20;     resource_group_name = "rg-application-demo"

&#x20;     location            = "South Africa North"



&#x20;     tags = {

&#x20;       environment = "demo"

&#x20;       managed_by  = "terraform"

&#x20;     }

&#x20;   }



&#x20;   networking = {

&#x20;     resource_group_name = "rg-networking-demo"

&#x20;     location            = "South Africa North"



&#x20;     tags = {

&#x20;       environment = "demo"

&#x20;       managed_by  = "terraform"

&#x20;     }

&#x20;   }

&#x20; }

}



output "resource_group_ids" {

&#x20; value = module.resource_groups.ids

}

```



Run Terraform from your consuming root configuration:



```bash

terraform init

terraform validate

terraform plan

```



Review the plan before deciding whether to deploy:



```bash

terraform apply

```



**Note:** The example is illustrative. It does not mean this repository has deployed these resources.



## Validation Results



**Validation status: PASSED**



The recorded final validation was completed on 31 October 2026.



| Metric | Result |

|---|---:|

| Terraform modules discovered | 94 |

| Initialization passed | 94 |

| Initialization failed | 0 |

| Configuration validation passed | 94 |

| Configuration validation failed | 0 |

| Validation skipped | 0 |

| Documentation-only directories | 1 |



**Provider used:** HashiCorp AzureRM v5.12.0.



Validation commands:



```bash

terraform init -backend=false -input=false -no-color



terraform validate -no-color

```



The validation process checks Terraform initialization and configuration validity. It does not establish that every module has been deployed, integration-tested, security-audited, or verified in a production environment.



No Azure resources were deployed. No Terraform plan or apply was executed during the recorded validation.



See \[Final Validation Summary](docs/validation/final-validation-summary.md).



## Security Considerations



- Do not commit secrets, credentials, access keys, or sensitive `.tfvars` files.

- Use managed identities or secure authentication mechanisms where appropriate.

- Apply least-privilege permissions.

- Review Terraform plans before applying infrastructure changes.

- Review networking rules, access controls, and resource configurations against your organization's security requirements.

- Test modules in a non-production environment before production adoption.



## Contributing



Contributions and improvements are welcome.



1\. Fork the repository.

2\. Create a feature branch.

3\. Follow the existing module directory structure.

4\. Use descriptive variable names and outputs.

5\. Document module inputs, outputs, and requirements.

6\. Run Terraform initialization and validation.

7\. Submit a pull request with a clear description of your changes.



## License



This project is licensed under the MIT License. See \[LICENSE](LICENSE) for details.



## Author



**GitHub:** \[sandeep1991mishra-sys](https://github.com/sandeep1991mishra-sys)



---



If you find this project useful, consider giving the repository a ⭐ on GitHub.
