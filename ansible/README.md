# 🤖 Ansible Automation Playbooks

This directory contains the Ansible playbooks and roles needed to automate the provisioning and deployment of the **Visit Counter** application, which is running within a K3s cluster on an Azure VM.

## 🧩 Features

- Installs system dependencies and Ansible roles.
- Deploys and configures a lightweight K3s cluster.
- Clones the repository with Kubernetes manifests.
- Applies the Kubernetes deployment using `kubectl`.
- Modularized using Ansible roles for clarity and reusability.

## 📂 Main Components

- `inventory/hosts.ini`: Defines the target host where Ansible will connect.
- `install.yml`: First playbook, which installs necessary dependencies and prepares the system.
- `deploy.yml`: Second playbook, which performs the full deployment of the application on the K3s cluster.
- `roles/`: Contains modular roles for:
  - `dependencies`: Installing system packages and tools (Docker, Git, etc.).
  - `k3s-config`: Configuring K3s cluster and `kubectl`.
  - `clone`: Cloning the app repository to its latest version.
  - `deploy`: Applying Kubernetes manifests to deploy the app.

## ☑️ Requirements

- Ansible >= 2.10
- Access to the target VM (via SSH).
- A previously provisioned Azure VM with K3s-compatible Linux distribution (e.g., Ubuntu 22.04).
- Proper inventory file with host IP and SSH configuration.

## ▶️ Usage

```bash
# Run initial setup and installation
ansible-playbook -i inventory/hosts.ini install.yml

# Deploy the application to the K3s cluster
ansible-playbook -i inventory/hosts.ini deploy.yml
```

Ensure that your SSH keys are properly configured and the target host is accessible before running the playbooks.
