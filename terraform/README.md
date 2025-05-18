# ⛓️ Terraform Infrastructure Configuration

This directory contains the Terraform configuration files used to provision and manage the infrastructure required for this project into the Microsoft Azure Cloud.

## 🧱 Structure

- `main.tf` – Entry point for the Terraform configuration. Defines the main infrastructure resources.
- `variables.tf` – Declares input variables used across the configuration.
- `outputs.tf` – Defines the output values to be displayed after execution.
- `providers.tf` – Configures the provider.

## ☑️ Requirements

- Terraform v1.x
- A supported cloud provider account (in this case, Microsoft Azure)
- Proper credentials configured (e.g., via environment variables or CLI login)

## ⚒️ Usage

```bash
# Initialize the configuration
terraform init

# Review the execution plan
terraform plan

# Apply the configuration
terraform apply

# Destroy the resources
terraform destroy
