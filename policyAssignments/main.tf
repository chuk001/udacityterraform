terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-RG"
  location = "${var.location}"
}

provider "azurerm" {
  features {}
}

resource "azurerm_policy_definition" "deny_untagged_resources" {
  name         = "deny-untagged-resources"
  display_name = "Deny creation of untagged resources"
  policy_type  = "Custom"
  mode         = "All"

  policy_rule = <<POLICY_RULE
{
  "if": {
    "field": "tags",
    "exists": "false"
  },
  "then": {
    "effect": "deny"
  }
}
POLICY_RULE
}

resource "azurerm_resource_group_policy_assignment" "example" {
  name                 = "example"
  resource_group_id    = azurerm_resource_group.example.id
  policy_definition_id = azurerm_policy_definition.deny_untagged_resources.id

}