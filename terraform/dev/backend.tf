terraform {
  backend "gcs" {
    bucket = "vaani-tf-state-500510"
    prefix = "terraform/state"
  }
}