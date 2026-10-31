# Azure IP Group Module
# 
# Overview
# 
# This Terraform module creates Azure IP Groups to organize IP addresses and CIDR ranges into reusable collections. IP Groups  can be used with supported Azure networking and security services, including Azure Firewall.
# 
# Features
# 
# Supports multiple IP Groups using for_each.
# 
# Configurable Resource Group and Azure region.
# 
# Accepts multiple IPv4 or IPv6 addresses and CIDR ranges, subject to Azure service support.
# 
# Supports optional resource tags.
# 
# Exposes IP Group IDs, names, locations, Resource Group names, and configured CIDRs.