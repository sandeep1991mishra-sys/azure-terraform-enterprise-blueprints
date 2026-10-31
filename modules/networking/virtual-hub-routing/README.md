# Virtual Hub Routing



Reusable Terraform module for managing Azure Virtual Hub route tables using the AzureRM provider.



## Features



- Supports multiple Virtual Hub route tables through `for_each`.

- Supports multiple routes within each route table using dynamic blocks.

- Supports optional route table labels.

- Uses strongly typed input variables.

- Exposes route table IDs and names as outputs.

- Designed for reusable Azure infrastructure deployments.



## Requirements



| Name | Version |

|---|---|

| Terraform | >= 1.5.0 |

| AzureRM Provider | 5.12.0 |



## Module Structure



```text

virtual-hub-routing/

├── main.tf

├── variables.tf

├── outputs.tf

├── versions.tf

└── README.md

```



## Usage



```hcl

module "virtual_hub_routing" {

  source = "./modules/networking/virtual-hub-routing"



  resources = {

    application_routes = {

      name           = "application-routes"

      virtual_hub_id = azurerm_virtual_hub.example.id



      labels = ["application", "production"]



      routes = [

        {

          name              = "on-premises-route"

          destinations      = ["10.10.0.0/16"]

          destinations_type = "CIDR"

          next_hop          = azurerm_firewall.example.id

          next_hop_type     = "ResourceId"

        }

      ]

    }

  }

}

```



The example assumes that the Virtual Hub and Azure Firewall already exist in the consuming Terraform configuration. This module does not create those resources.



## Inputs



| Name | Description | Type | Required |

|---|---|---|---|

| resources | Map of Virtual Hub route table configurations | map(object(...)) | No |

| name | Route table name | string | Yes, per entry |

| virtual_hub_id | Existing Virtual Hub resource ID | string | Yes, per entry |

| labels | Route table labels | set(string) | No |

| routes | List of route configurations | list(object(...)) | No |

| routes.name | Route name | string | Yes, per route |

| routes.destinations | Route destination prefixes | set(string) | Yes, per route |

| routes.destinations_type | Destination type | string | Yes, per route |

| routes.next_hop | Next-hop value | string | Yes, per route |

| routes.next_hop_type | Next-hop type | string | No |



## Outputs



| Name | Description |

|---|---|

| ids | Map of Virtual Hub route table resource IDs |

| names | Map of Virtual Hub route table names |



## Important Notes



- The referenced Virtual Hub must already exist.

- This module manages Virtual Hub route tables and their inline routes.

- It does not create Virtual Hubs, Virtual WANs, or Azure Firewalls.

- Route destinations and next-hop values must comply with Azure Virtual WAN routing requirements.

- Do not commit credentials, private keys, or sensitive values to the repository.



## Validation



Run these commands from the repository root:



```powershell

terraform -chdir="modules/networking/virtual-hub-routing" fmt -check

terraform -chdir="modules/networking/virtual-hub-routing" init

terraform -chdir="modules/networking/virtual-hub-routing" validate

```



These commands check formatting, initialize the provider, and validate the Terraform configuration. They do not deploy Azure resources.



## License



This module is distributed under the MIT License.
