# Azure Network Security Perimeter Module
# 
# Overview
# 
# This Terraform module creates Azure Network Security Perimeters (NSPs), which help control network access to supported Azure # platform-as-a-service (PaaS) resources.
# 
# Features
# 
# Supports multiple perimeters using for_each.
# 
# Configurable Resource Group and Azure region.
# 
# Supports optional resource tags.
# 
# Exposes perimeter IDs, names, locations, and Resource Group names.