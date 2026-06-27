variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "router_name" {
  type = string
}

variable "nat_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "gpu_type" {
  type = string
}

variable "gpu_count" {
  type = number
}

variable "gpu_node_count" {
  type = number
}

variable "master_ipv4_cidr" {
  type = string
}

variable "pods_cidr" {
  type = string
}

variable "services_cidr" {
  type = string
}

variable "gke_service_account_name" {
  type = string
}

variable "gke_service_account_display_name" {
  type = string
}

variable "artifact_repository_name" {
  type = string
}