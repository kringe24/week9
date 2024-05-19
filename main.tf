terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.28.0"
    }
  }
}

provider "google" {
    #Confiuration options
    credentials = "forsakened-project-bf8d629dbcb0.json"
    project = var.project
    region = var.region
}

# This is the bucket for your state files
resource "google_storage_bucket" "raw" {
  project = var.project
  name = "${var.data_project}-raw"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
  labels = local.labels
}




locals {
    labels = {
        "data-project" = var.data_project
    }
}

variable "project" {
    type = string
    default = "forsakened-project"
    description = "ID Google project"
}

variable "region" {
    type = string
    default = "us-central1"
    description = "Region Google project"
}

variable  "data_project" {
    type = string
    default = "mysat2_cicd_project"
    description = "Name of data pipeline project to use as resource prefix"
}






