\# Azure Terraform Module Inventory



This inventory lists the implemented reusable Azure Terraform modules in this repository.



\*\*Implemented Terraform modules:\*\* 95

\*\*Categories:\*\* 10



\*\*Documentation-only folders:\*\* 2

\*\*Azure resources deployed during module development:\*\* None



All implemented modules use reusable Terraform configurations and are validated against AzureRM provider version 5.12.0.



\## Module Inventory



| Category | Module | Resource type |

|---|---|---|

| application-services | app-configuration | `azurerm\\\\\\\_app\\\\\\\_configuration` |

| application-services | app-service-plan | `azurerm\\\\\\\_service\\\\\\\_plan` |

| application-services | container-app-environment | `azurerm\\\\\\\_container\\\\\\\_app\\\\\\\_environment` |

| application-services | linux-function-app | `azurerm\\\\\\\_linux\\\\\\\_function\\\\\\\_app` |

| application-services | linux-web-app | `azurerm\\\\\\\_linux\\\\\\\_web\\\\\\\_app` |

| application-services | windows-web-app | `azurerm\\\\\\\_windows\\\\\\\_web\\\\\\\_app` |

| backup-disaster-recovery | backup-policy-vm | `azurerm\\\\\\\_backup\\\\\\\_policy\\\\\\\_vm` |

| backup-disaster-recovery | backup-protected-vm | `azurerm\\\\\\\_backup\\\\\\\_protected\\\\\\\_vm` |

| backup-disaster-recovery | backup-vault | `azurerm\\\\\\\_data\\\\\\\_protection\\\\\\\_backup\\\\\\\_vault` |

| backup-disaster-recovery | recovery-services-vault | `azurerm\\\\\\\_recovery\\\\\\\_services\\\\\\\_vault` |

| compute | automatic-guest-patching | `azurerm\\\\\\\_linux\\\\\\\_virtual\\\\\\\_machine` |

| compute | availability-set | `azurerm\\\\\\\_availability\\\\\\\_set` |

| compute | boot-diagnostics | `azurerm\\\\\\\_linux\\\\\\\_virtual\\\\\\\_machine` |

| compute | capacity-reservation | `azurerm\\\\\\\_capacity\\\\\\\_reservation` |

| compute | capacity-reservation-group | `azurerm\\\\\\\_capacity\\\\\\\_reservation\\\\\\\_group` |

| compute | dedicated-host | `azurerm\\\\\\\_dedicated\\\\\\\_host` |

| compute | dedicated-host-group | `azurerm\\\\\\\_dedicated\\\\\\\_host\\\\\\\_group` |

| compute | disk-attachment | `azurerm\\\\\\\_virtual\\\\\\\_machine\\\\\\\_data\\\\\\\_disk\\\\\\\_attachment` |

| compute | gallery-image-definition | `azurerm\\\\\\\_shared\\\\\\\_image` |

| compute | gallery-image-version | `azurerm\\\\\\\_shared\\\\\\\_image\\\\\\\_version` |

| compute | linux-virtual-machine | `azurerm\\\\\\\_linux\\\\\\\_virtual\\\\\\\_machine` |

| compute | managed-disk | `azurerm\\\\\\\_managed\\\\\\\_disk` |

| compute | proximity-placement-group | `azurerm\\\\\\\_proximity\\\\\\\_placement\\\\\\\_group` |

| compute | shared-image-gallery | `azurerm\\\\\\\_shared\\\\\\\_image\\\\\\\_gallery` |

| compute | virtual-machine-data-disk | `azurerm\\\\\\\_virtual\\\\\\\_machine\\\\\\\_data\\\\\\\_disk\\\\\\\_attachment` |

| compute | virtual-machine-extension | `azurerm\\\\\\\_virtual\\\\\\\_machine\\\\\\\_extension` |

| compute | virtual-machine-run-command | `azurerm\\\\\\\_virtual\\\\\\\_machine\\\\\\\_run\\\\\\\_command` |

| compute | virtual-machine-scale-set | `azurerm\\\\\\\_linux\\\\\\\_virtual\\\\\\\_machine\\\\\\\_scale\\\\\\\_set` |

| compute | windows-virtual-machine | `azurerm\\\\\\\_windows\\\\\\\_virtual\\\\\\\_machine` |

| databases | cosmosdb-account | `azurerm\\\\\\\_cosmosdb\\\\\\\_account` |

| databases | mssql-database | `azurerm\\\\\\\_mssql\\\\\\\_database` |

| databases | mssql-server | `azurerm\\\\\\\_mssql\\\\\\\_server` |

| databases | mysql-flexible-server | `azurerm\\\\\\\_mysql\\\\\\\_flexible\\\\\\\_server` |

| databases | postgresql-flexible-server | `azurerm\\\\\\\_postgresql\\\\\\\_flexible\\\\\\\_server` |

| dns\_server | dns-a-record | `azurerm\\\\\\\_dns\\\\\\\_a\\\\\\\_record` |

| dns\_server | dns-cname-record | `azurerm\\\\\\\_dns\\\\\\\_cname\\\\\\\_record` |

| dns\_server | dns-zone | `azurerm\\\\\\\_dns\\\\\\\_zone` |

| dns\_server | private-dns-vnet-link | `azurerm\\\\\\\_private\\\\\\\_dns\\\\\\\_zone\\\\\\\_virtual\\\\\\\_network\\\\\\\_link` |

| dns\_server | private-dns-zone | `azurerm\\\\\\\_private\\\\\\\_dns\\\\\\\_zone` |

| identity | custom-role-definition | `azurerm\\\\\\\_role\\\\\\\_definition` |

| identity | federated-identity-credential | `azurerm\\\\\\\_federated\\\\\\\_identity\\\\\\\_credential` |

| identity | role-assignment | `azurerm\\\\\\\_role\\\\\\\_assignment` |

| identity | user-assigned-identity | `azurerm\\\\\\\_user\\\\\\\_assigned\\\\\\\_identity` |

| monitoring | action-group | `azurerm\\\\\\\_monitor\\\\\\\_action\\\\\\\_group` |

| monitoring | application-insights | `azurerm\\\\\\\_application\\\\\\\_insights` |

| monitoring | diagnostic-setting | `azurerm\\\\\\\_monitor\\\\\\\_diagnostic\\\\\\\_setting` |

| monitoring | log-analytics-workspace | `azurerm\\\\\\\_log\\\\\\\_analytics\\\\\\\_workspace` |

| monitoring | metric-alert | `azurerm\\\\\\\_monitor\\\\\\\_metric\\\\\\\_alert` |

| networking | application-gateway | `azurerm\\\\\\\_application\\\\\\\_gateway` |

| networking | azure-firewall | `azurerm\\\\\\\_firewall` |

| networking | bastion | `azurerm\\\\\\\_bastion\\\\\\\_host` |

| networking | ddos\_protection\_plan | `azurerm\\\\\\\_network\\\\\\\_ddos\\\\\\\_protection\\\\\\\_plan` |

| networking | expressroute-circuit | `azurerm\\\\\\\_express\\\\\\\_route\\\\\\\_circuit` |

| networking | expressroute-gateway | `azurerm\\\\\\\_express\\\\\\\_route\\\\\\\_gateway` |

| networking | firewall-policy | `azurerm\\\\\\\_firewall\\\\\\\_policy` |

| networking | front-door | `azurerm\\\\\\\_cdn\\\\\\\_frontdoor\\\\\\\_profile` |

| networking | ip\_groups | `azurerm\\\\\\\_ip\\\\\\\_group` |

| networking | load-balancer | `azurerm\\\\\\\_lb` |

| networking | local-network-gateway | `azurerm\\\\\\\_local\\\\\\\_network\\\\\\\_gateway` |

| networking | nat\_gateway | `azurerm\\\\\\\_nat\\\\\\\_gateway` |

| networking | network\_interface | `azurerm\\\\\\\_network\\\\\\\_interface` |

| networking | network\_manager | `azurerm\\\\\\\_network\\\\\\\_manager` |

| networking | network\_security\_group | `azurerm\\\\\\\_network\\\\\\\_security\\\\\\\_group` |

| networking | network\_security\_perimeter | `azurerm\\\\\\\_network\\\\\\\_security\\\\\\\_perimeter` |

| networking | network\_watcher | `azurerm\\\\\\\_network\\\\\\\_watcher` |

| networking | nsg-rule | `azurerm\\\\\\\_network\\\\\\\_security\\\\\\\_rule` |

| networking | private-dns-zone | `azurerm\\\\\\\_private\\\\\\\_dns\\\\\\\_zone` |

| networking | private-dns-zone-vnet-link | `azurerm\\\\\\\_private\\\\\\\_dns\\\\\\\_zone\\\\\\\_virtual\\\\\\\_network\\\\\\\_link` |

| networking | private-endpoint | `azurerm\\\\\\\_private\\\\\\\_endpoint` |

| networking | private-link-service | `azurerm\\\\\\\_private\\\\\\\_link\\\\\\\_service` |

| networking | public\_ip | `azurerm\\\\\\\_public\\\\\\\_ip` |

| networking | route | `azurerm\\\\\\\_route` |

| networking | route\_table | `azurerm\\\\\\\_route\\\\\\\_table` |

| networking | subnet\_nsg\_association | `azurerm\\\\\\\_subnet\\\\\\\_network\\\\\\\_security\\\\\\\_group\\\\\\\_association` |

| networking | subnet\_route\_table\_association | `azurerm\\\\\\\_subnet\\\\\\\_route\\\\\\\_table\\\\\\\_association` |

| networking | subnets | `azurerm\\\\\\\_subnet` |

| networking | traffic-manager | `azurerm\\\\\\\_traffic\\\\\\\_manager\\\\\\\_profile` |

| networking | virtual-hub | `azurerm\\\\\\\_virtual\\\\\\\_hub` |

| networking | virtual-hub-connection | `azurerm\\\\\\\_virtual\\\\\\\_hub\\\\\\\_connection` |

| networking | virtual-hub-routing | `azurerm\\\\\\\_virtual\\\\\\\_hub\\\\\\\_route\\\\\\\_table` |

| networking | virtual-network | `azurerm\\\\\\\_virtual\\\\\\\_network` |

| networking | virtual\_wan | `azurerm\\\\\\\_virtual\\\\\\\_wan` |

| networking | vnet\_peering | `azurerm\\\\\\\_virtual\\\\\\\_network\\\\\\\_peering` |

| networking | vpn-connection | `azurerm\\\\\\\_virtual\\\\\\\_network\\\\\\\_gateway\\\\\\\_connection` |

| networking | vpn-gateway | `azurerm\\\\\\\_vpn\\\\\\\_gateway` |

| security | key-vault | `azurerm\\\\\\\_key\\\\\\\_vault` |

| security | key-vault-secret | `azurerm\\\\\\\_key\\\\\\\_vault\\\\\\\_secret` |

| security | network-security-perimeter | `azurerm\\\\\\\_network\\\\\\\_security\\\\\\\_perimeter` |

| security | security-center-contact | `
