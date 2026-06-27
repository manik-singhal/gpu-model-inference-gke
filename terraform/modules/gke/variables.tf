variable "cluster_name" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
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

variable "service_account_email" {
  type = string
}