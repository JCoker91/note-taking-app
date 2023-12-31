terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "3.0.2"
        }
    }
}


variable "docker_token" {}
variable "docker_username" {}
variable "django_secret_key" {}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"

  registry_auth {
    address = "registry-1.docker.io"
    username = var.docker_username
    password = var.docker_token
  }
}

resource "docker_image" "web" {
    name = "jcoker91/nta-web:dev"
    keep_locally = false
}

resource "docker_container" "web" {
    image = docker_image.web.image_id
    name = "web_container"
    ports {
        internal = 80
        external = 80
    }
}

resource "docker_image" "api" {
    name = "jcoker91/nta-api:dev"
    keep_locally = false
}

resource "docker_container" "api" {
    image = docker_image.api.image_id
    name = "api_container"
    env = ["SECRET_KEY={$var.django_secret_key}"]
    ports {
        internal = 80
        external = 8000
    }
}