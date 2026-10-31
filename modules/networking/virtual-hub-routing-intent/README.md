\# Virtual Hub Routing Intent



Reusable Terraform module for configuring Azure Virtual Hub routing intent.



\## Features



\- Supports multiple Virtual Hub routing intent resources using `for\_each`.

\- Supports multiple routing policies per resource.

\- Uses strongly typed input variables.

\- Validates that each routing intent contains at least one policy.

\- Exposes resource IDs and names as outputs.



\## Requirements



| Name | Version |

|---|---|

| Terraform | >= 1.5.0 |

| AzureRM Provider | 5.12.0 |



\## Usage



```hcl

module "virtual\_hub\_routing\_intent" {

&#x20; source = "./modules/networking/virtual-hub-routing-intent"



&#x20; resources = {

&#x20;   hub\_security = {

&#x20;     name           = "hub-security-routing"

&#x20;     virtual\_hub\_id = azurerm\_virtual\_hub.example.id



&#x20;     routing\_policies = \[

&#x20;       {

&#x20;         name         = "internet-traffic"

&#x20;         destinations = \["Internet"]

&#x20;         next\_hop     = azurerm\_firewall.example.id

&#x20;       },

&#x20;       {

&#x20;         name         = "private-traffic"

&#x20;         destinations = \["PrivateTraffic"]

&#x20;         next\_hop     = azurerm\_firewall.example.id

&#x20;       }

&#x20;     ]

&#x20;   }

&#x20; }

}

```



The Virtual Hub and Azure Firewall must already exist in the consuming configuration.



\## Inputs



| Name | Description | Type | Required |

|---|---|---|---|

| resources | Routing intent configurations | map(object(...)) | No |

| name | Routing intent name | string | Yes, per entry |

| virtual\_hub\_id | Existing Virtual Hub ID | string | Yes, per entry |

| routing\_policies | Routing policy configurations | list(object(...)) | Yes, per entry |

| routing\_policies.name | Policy name | string | Yes |

| routing\_policies.destinations | Policy destinations | list(string) | Yes |

| routing\_policies.next\_hop | Next-hop resource ID | string | Yes |



\## Outputs



| Name | Description |

|---|---|

| ids | Map of routing intent resource IDs |

| names | Map of routing intent names |



\## Validation



```powershell

terraform -chdir="modules/networking/virtual-hub-routing-intent" fmt

terraform -chdir="modules/networking/virtual-hub-routing-intent" init

terraform -chdir="modules/networking/virtual-hub-routing-intent" validate

```



These commands do not deploy Azure resources.



