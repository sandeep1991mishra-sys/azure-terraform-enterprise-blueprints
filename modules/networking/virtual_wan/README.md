# Azure Virtual WAN Module

## Overview

This Terraform module creates Azure Virtual WAN resources to support centralized networking across Azure virtual networks, branch locations, and remote users.

## Features

- Supports multiple Virtual WAN resources using for_each.

- Configurable Azure region and Resource Group.

- Supports Basic and Standard WAN types.

- Configurable VPN encryption behavior.

- Supports optional resource tags.

- Exposes resource IDs, names, locations, Resource Group names, and WAN types.