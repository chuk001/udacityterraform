# udacityterraform

This Terraform template automates the deployment of an Azure virtual machine using a Packer image. It also includes an Azure Policy to ensure that all resources are tagged appropriately.

Prerequisites
Before you begin, ensure you have the following prerequisites installed:
1. Terraform
2. Azure Cli

You'll also need:

An Azure account and subscription
A Packer image uploaded to Azure

Usage

 Initialize Terraform
 Configure Input Variables
 Deploy the Infrastructure
 Access the Virtual Machine


Azure Policy
This template includes an Azure Policy to ensure that all resources deployed within the specified Resource Group are tagged appropriately. The policy definition is located in the main.tf file.
