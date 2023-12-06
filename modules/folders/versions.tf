terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 5.7"
    }
  }
}

provider "google" {}