#keyword function name of the function --- this is not for production ,tf RG name
#resource "azurerm_resource_group" "chandra-rsgrp"{
#Actual azure resource group name 
#name = "chandra-resource-group1"
#location = "Central US"
data "azurerm_resource_group" "Chandra_resource_1" {
    name = "Chandra_resource_1"
  }

