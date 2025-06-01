# ⛓️ Terraform Infrastructure Configuration

This directory contains Terraform configuration files to deploy a basic infrastructure on **Microsoft Azure**. It provisions a single Linux virtual machine with networking components configured to support a K3s (lightweight Kubernetes) cluster deployment.

## 🧱 Structure

- `main.tf` – Defines resources including the resource group, virtual network, subnet, network interface, public IP, NSG, and a Linux VM.
- `variables.tf` – Defines input variables used to customize the deployment.
- `security-rules.tf` – Defines the security rules for the NSG.
- `outputs.tf` – Outputs the public IP and VM ID after deployment.
- `providers.tf` – Specifies the required providers and versions.

## ☑️ Requirements

- Terraform >= 1.12.0
- A supported cloud provider account (in this case, Microsoft Azure).
- Azure CLI authenticated (`az login`).
- Proper credentials configured (e.g., via environment variables or CLI login).

## ▶️ Usage

```bash
# Initialize the configuration
terraform init

# Review the execution plan
terraform plan

# Apply the configuration
terraform apply -auto-approve -var "ssh_public_key=[your-public-key]"

# In case that you want to destroy the resources
terraform destroy
