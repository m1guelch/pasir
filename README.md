# PASIR – Scalable Cloud Infrastructure: Automated Deployment and Provisioning

**PASIR** is a full-stack infrastructure automation project that demonstrates the complete lifecycle of a containerized web application deployed in the cloud. It uses modern DevOps tools and methodologies to provision, configure, deploy, and manage a scalable and reproducible environment.

> This project was developed as part of the final degree project for *Systems and Network Administration (ASIR)*.

## 🧩 Project Structure

- 📁 app/ → Source code of the Flask web app (visit counter).
- 📁 terraform/ → Infrastructure provisioning in Azure using Terraform.
- 📁 ansible/ → Configuration management and provisioning with Ansible.
- 📁 k8s/ → Kubernetes manifests for deploying the app on K3s.
- 📁 .github/ → GitHub Actions CI/CD workflows.

## 📈 Application: Visit Counter

The deployed application is a lightweight **Flask-based visit counter**. Each visit increments a counter stored in a persistent SQLite database. The app is containerized using Docker and includes health check endpoints.

### Features

- Real-time visit counter with persistent storage.
- Built with Python 3.13 and Flask.
- SQLite database stored on a PersistentVolume.
- Packaged with Gunicorn and deployed as a non-root user.
- Dockerized. Kubernetes-ready.

## ☁️ Infrastructure as Code (Terraform)

Terraform is used to provision infrastructure in the **Microsoft Azure** platform, including:

- A resource group and virtual network.
- A subnet, network interface, and public IP.
- A network security group with custom rules.
- A Linux VM configured to host the K3s cluster.

### Requirements

- Azure account and CLI (`az login`)
- Terraform >= 1.12.0
- SSH key pair for VM access

## ⚙️ Provisioning & Configuration (Ansible)

Ansible automates the post-provisioning setup of the VM, including:

- Installation of dependencies.
- Installation and setup of K3s.
- Cloning the project repository.
- Applying Kubernetes manifests to deploy the app.

The playbooks are organized into roles for better structure and reusability.

## ☸️ Kubernetes Deployment

Kubernetes manifests define the resources necessary to run the app on a **K3s** cluster:

- `Deployment`: Runs the app container with health checks and environment variables.
- `Service`: Exposes the app via NodePort.
- `PersistentVolumeClaim`: Ensures data persistence for SQLite.

## 🔁 CI/CD with GitHub Actions

A custom GitHub Actions workflow automates the entire deployment pipeline:

1. **On push to `main` branch**:
   - Builds the Docker image.
   - Pushes to DockerHub.
   - Applies Kubernetes manifests.
   - Updates the running deployment with the new image.
   - Performs a health check on the `/health` endpoint.

### Secrets/Variables required:

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`
- `KUBECONFIG_DATA` (kubeconfig for the target cluster)

## 🖥️ Technologies Used

- **Cloud Provider**: Microsoft Azure
- **Provisioning**: Terraform
- **Configuration Management**: Ansible
- **Containerization**: Docker
- **Orchestration**: Kubernetes (K3s)
- **CI/CD**: GitHub Actions
- **Monitoring**: HTTP health probes
- **Web App**: Python + Flask + Gunicorn + SQLite

## ☑️ Requirements

Before using this project, ensure you have:

- A Microsoft Azure account
- A GitHub repository with secrets configured
- Docker and DockerHub account
- Local tools:
  - Terraform
  - Ansible
  - kubectl
  - Azure CLI
  - SSH

## 📦 How to Deploy

1. **Deploy infrastructure** with Terraform:
   ```bash
   cd terraform/
   terraform init
   terraform apply -auto-approve -var "ssh_public_key=[your-public-key]"
   ```

2. **Provision and configure VM** with Ansible:
   ```bash
    cd ansible/
    ansible-playbook -i inventory/hosts.ini install.yml
    ansible-playbook -i inventory/hosts.ini deploy.yml
    ```

3. **Push changes to GitHub** and let GitHub Actions handle:
    - Docker image build & push
    - App deployment to K3s
    - Health check and verification

4. **Access the app** at:
   ```bash
    http://<your-domain>:30080
    ```

## ✅ Status
- Completed and tested.
- Fully automated provisioning and deployment.
- Secure container practices.
- Easily replicable and scalable infrastructure.

## 🤝 Contributing

If you'd like to contribute to the project, feel free to submit a pull request or suggest improvements via the [Issues](../../issues) section.

All kinds of contributions — bug reports, ideas, documentation improvements, or pull requests — are welcome and appreciated.

## 👨‍💻 Contact

- **Creator**: Miguel Collado Hidalgo
- **LinkedIn**: [m1guelch](https://www.linkedin.com/in/m1guelch/)
- **Email**: [miguelcolladohidalgo@gmail.com](mailto:miguelcolladohidalgo@gmail.com)
