resource "google_container_cluster" "main" {

  name     = var.cluster_name
  location = var.zone

  network    = var.network
  subnetwork = var.subnetwork

  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false

    master_ipv4_cidr_block = var.master_ipv4_cidr
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
}

resource "google_container_node_pool" "gpu" {

  name     = "${var.cluster_name}-gpu-pool"

  cluster  = google_container_cluster.main.id
  location = var.zone

  node_count = var.gpu_node_count

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {

    machine_type = var.machine_type

    service_account = var.service_account_email

    disk_size_gb = 150
    disk_type    = "pd-balanced"

    image_type = "COS_CONTAINERD"

    guest_accelerator {
      type  = var.gpu_type
      count = var.gpu_count
    }
  }
}

