\# Virtual Hub Connection



Reusable Terraform module for managing Azure Virtual Hub connections to remote Virtual Networks.



\## Features



\- Supports multiple Virtual Hub connections using `for\_each`.

\- Supports existing Virtual Hub and remote Virtual Network IDs.

\- Supports optional Internet Security configuration.

\- Supports optional routing configuration.

\- Exposes connection IDs and names as outputs.



\## Requirements



| Name | Version |

|---|---|

| Terraform | >= 1.5.0 |

| AzureRM Provider | 5.12.0 |



\## Usage



```hcl

module "virtual\_hub\_connection" {

&#x20; source = "./modules/networking/virtual-hub-connection"



&#x20; resources = {

&#x20;   application\_vnet = {

&#x20;     name                      = "application-vnet-connection"

&#x20;     virtual\_hub\_id            = azurerm\_virtual\_hub.example.id

&#x20;     remote\_virtual\_network\_id = azurerm\_virtual\_network.application.id



&#x20;     internet\_security\_enabled = true



&#x20;     routing = {

&#x20;       associated\_route\_table\_id = azurerm\_virtual\_hub\_route\_table.example.id

&#x20;     }

&#x20;   }

&#x20; }

}

```



The Virtual Hub, remote Virtual Network, and referenced route table must already exist in the consuming configuration.



\## Inputs



| Name | Description | Type | Required |

|---|---|---|---|

| resources | Map of Virtual Hub connection configurations | map(object(...)) | No |

| name | Connection name | string | Yes, per entry |

| virtual\_hub\_id | Existing Virtual Hub ID | string | Yes, per entry |

| remote\_virtual\_network\_id | Existing remote VNet ID | string | Yes, per entry |

| internet\_security\_enabled | Enable Internet Security | bool | No |

| routing | Optional routing configuration | object(...) | No |

| associated\_route\_table\_id | Associated route table ID | string | No |

| inbound\_route\_map\_id | Inbound route map ID | string | No |

| outbound\_route\_map\_id | Outbound route map ID | string | No |

| static\_vnet\_propagate\_static\_routes\_enabled | Enable static route propagation | bool | No |



\## Outputs



| Name | Description |

|---|---|

| ids | Map of Virtual Hub connection resource IDs |

| names | Map of Virtual Hub connection names |



\## Important Notes



\- This module creates Virtual Hub connections only.

\- The Virtual Hub and remote Virtual Network must already exist.

\- Routing settings are optional.

\- Do not commit credentials or sensitive values to the repository.



\## Validation



```powershell

terraform -chdir="modules/networking/virtual-hub-connection" fmt

terraform -chdir="modules/networking/virtual-hub-connection" init

terraform -chdir="modules/networking/virtual-hub-connection" validate

```



These commands do not deploy Azure resources.



