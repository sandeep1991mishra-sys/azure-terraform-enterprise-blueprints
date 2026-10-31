# Azure DDoS Protection Plan Module
# 
# Overview
# 
# This Terraform module creates Azure DDoS Protection Plans to help protect supported Azure virtual networks against Distributed # Denial of Service (DDoS) attacks.
# 
# Features
# 
# Supports multiple DDoS Protection Plans using for_each.
# 
# Configurable Resource Group and Azure region.
# 
# Supports optional resource tags.
# 
# Exposes plan IDs, names, locations, and Resource Group names.