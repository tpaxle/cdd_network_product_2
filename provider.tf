

terraform {
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "1.14.0"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address  = var.hostname
  username = var.username
  password = var.password
  port     = var.port
}
