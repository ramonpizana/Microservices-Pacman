output "resource_group" {
    value = data.azurerm_resource_group.rg.name
}

output "location" {
    value = data.azurerm_resource_group.rg.location
}