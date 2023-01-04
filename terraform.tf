terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.24.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }
}
