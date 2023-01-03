provider "docker" {}
provider "random" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "hello-terraform"

  ports {
    internal = 80
    external = 8000
  }
}

resource "random_pet" "dog" {
  length = 2
}

module "nginx-pet" {
  source = "./nginx"

  container_name = "hello-${random_pet.dog.id}"
  nginx_port     = 8001
}

module "hello" {
  source  = "joatmon08/hello/random"
  version = "6.0.0"

  hellos = {
    hello        = random_pet.dog.id
    second_hello = "World"
  }

  some_key = "NOTSECRET"
}
