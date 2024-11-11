provider "google" {
  credentials = file("terraform-sa-key.json")
  project     = "cloud-native-ecommerce-jfields"
  region      = "us-central1"
  zone        = "us-central1-b"
}

resource "google_container_cluster" "primary" {
  name               = "flask-gke-cluster"
  location           = "us-central1"
  initial_node_count = 1
  remove_default_node_pool = true
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = 1

  node_config {
    machine_type = "e2-small"
    disk_size_gb = 10  # Reduce disk size to fit within quota
    disk_type    = "pd-standard"  # Use standard disks instead of SSDs
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 2  # Keep autoscaling minimal to avoid exceeding the quota
  }
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}
