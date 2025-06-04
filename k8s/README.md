# ☸️ Kubernetes Manifests

This directory contains Kubernetes manifests for deploying the **Visit Counter** app on a K3s cluster. It defines the necessary components to run the application with persistent storage, networking, and health checks.

## 🧩 Features

- Deployment with auto-restart and rolling updates.
- Persistent volume claim to store the SQLite database.
- NodePort service for external access to the application.
- Readiness and liveness probes for container health monitoring.
- Environment variable for database path configuration.

## 🚀 Technologies Used

- Kubernetes (K3s compatible)
- PersistentVolumeClaim (PVC)
- NodePort Service
- Probes for health checks
- Docker (container runtime)

## ☑️ Requirements

- A running Kubernetes cluster (for example, K3s).
- `kubectl` configured to interact with your cluster.
- Persistent storage support on the cluster.

## ▶️ Usage

Apply the manifests in the following order:

```bash
# Create the persistent volume claim
kubectl apply -f pvc.yaml

# Deploy the application
kubectl apply -f deployment.yaml

# Expose the deployment via NodePort
kubectl apply -f service.yaml
