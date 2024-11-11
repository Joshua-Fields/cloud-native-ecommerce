# Cloud-Native E-commerce Platform

This project is a cloud-native e-commerce platform built using **Flask**, **Docker**, and **Google Kubernetes Engine (GKE)**. The application is deployed as a containerized service with a LoadBalancer, demonstrating cloud infrastructure, Kubernetes orchestration, and secure network configuration.

## 🚀 Features

- **Cloud-Native Architecture**: Containerized Flask application deployed on Google Kubernetes Engine (GKE).
- **Private Cluster**: Secure GKE setup with private nodes and network access via a bastion host.
- **Networking Configuration**: Managed VPC, firewall rules, and authorized networks for secure access.
- **Load Balancer**: Exposes the Flask service via a LoadBalancer with an external IP.
- **Scalable Deployment**: Kubernetes `Deployment` ensures high availability with multiple replicas.

## 📦 Project Structure

```
cloud-native-ecommerce/
├── k8s/
│   ├── deployment.yaml   # Kubernetes Deployment manifest
│   ├── service.yaml      # Kubernetes Service manifest
├── Dockerfile            # Dockerfile for building the Flask app image
├── app/
│   └── main.py           # Flask application code
├── requirements.txt      # Python dependencies
├── .gitignore
├── README.md
└── LICENSE
```

## 🛠️ Setup & Installation

### Prerequisites

- Docker
- Google Cloud SDK (`gcloud`)
- Kubernetes CLI (`kubectl`)
- A Google Cloud Platform (GCP) account

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-username/cloud-native-ecommerce.git
cd cloud-native-ecommerce
```

### Step 2: Build the Docker Image

```bash
docker build -t gcr.io/cloud-native-ecommerce-jfields/cloud-native-ecommerce:latest .
```

### Step 3: Push Docker Image to Google Container Registry

```bash
docker push gcr.io/cloud-native-ecommerce-jfields/cloud-native-ecommerce:latest
```

### Step 4: Deploy on Kubernetes

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### Step 5: Access the Application

Get the external IP of the service:

```bash
kubectl get svc flask-service
```

Access the app via the external IP:

```
http://<EXTERNAL-IP>
```

## 🧩 Troubleshooting

If you encounter issues accessing the cluster from your local machine, ensure you have set up the bastion host correctly and have configured `master-authorized-networks`.

For authentication errors, ensure the `gke-gcloud-auth-plugin` is installed:

```bash
gcloud components install gke-gcloud-auth-plugin
```

## 📚 Additional Resources

- [Google Kubernetes Engine Documentation](https://cloud.google.com/kubernetes-engine/docs)
- [Flask Documentation](https://flask.palletsprojects.com/en/latest/)
- [Docker Documentation](https://docs.docker.com/)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
