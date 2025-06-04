# ⚙️ GitHub Actions Workflow

This directory contains the CI/CD workflow used to automate the lifecycle of the **Visit Counter** app. It handles building, publishing, and deploying the Docker image to a Kubernetes cluster running on a self-managed K3s node.

## 🧩 Features

- Automatically triggered on every push to the `main` branch.
- Builds a fresh Docker image using the latest app code.
- Pushes the image to DockerHub.
- Updates the deployment image and waits for rollout to complete.
- Health checks the application and verifies the final deployment.

## 🚀 Technologies Used

- GitHub Actions
- Docker & DockerHub
- Kubernetes (K3s)
- kubectl
- curl (for HTTP health checks)

## ☑️ Requirements

- `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` configured in GitHub Repository Variables/Secrets.
- `KUBECONFIG_DATA` secret containing the kubeconfig content for accessing the target K3s cluster.
- Working Kubernetes manifests in the `/k8s/` directory.
- A reachable node with public IP (used in `APP_URL`).

## ▶️ Usage

This workflow is triggered automatically on every push to the `main` branch. It performs the following steps:

1. **Checkout**: Clones the repo into the GitHub runner.
2. **Tagging**: Extracts a short commit hash to tag the Docker image.
3. **Docker Login**: Authenticates with DockerHub using secrets.
4. **Build & Push**: Builds the Docker image from `/app` and pushes it to DockerHub.
5. **Kubeconfig Setup**: Restores kubeconfig from the repository secret.
6. **Deploy to K3s**:
   - Applies all manifests from `/k8s/`.
   - Updates the image of the deployment.
   - Waits for the rollout to finish.
   - Performs a health check via `/health` endpoint.
7. **Post-deployment Verification**: Lists all cluster resources and outputs a success message with the app URL.

## 📍 Notes

- The workflow skips TLS verification for `kubectl` (`--insecure-skip-tls-verify=true`) since it's targeting a self-managed K3s cluster.
- The app must expose a `/health` endpoint for the health check to succeed.
