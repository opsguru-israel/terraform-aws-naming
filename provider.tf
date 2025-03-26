terraform {
  required_version = ">= 1.9.5"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }
}
