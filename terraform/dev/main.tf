module "vpc_network" {
  source = "../modules/vpc_network"

  network_name  = var.network_name
  subnet_name   = var.subnet_name
  region        = var.region
  subnet_cidr   = var.subnet_cidr
  pods_cidr     = var.pods_cidr
  services_cidr = var.services_cidr

  router_name = var.router_name
  nat_name    = var.nat_name
}

module "service_account" {

  source = "../modules/service_account"

  project_id = var.project_id

  account_id = var.gke_service_account_name

  display_name = var.gke_service_account_display_name

}

module "gke" {
  source = "../modules/gke"

  service_account_email = module.service_account.service_account_email

  cluster_name = var.cluster_name
  region       = var.region
  zone         = var.zone

  network    = module.vpc_network.network_name
  subnetwork = module.vpc_network.subnetwork_name

  machine_type   = var.machine_type
  gpu_type       = var.gpu_type
  gpu_count      = var.gpu_count
  gpu_node_count = var.gpu_node_count

  master_ipv4_cidr = var.master_ipv4_cidr
}

module "artifact_registry" {

  source = "../modules/artifact_registry"

  region = var.region

  repository_name = var.artifact_repository_name

}