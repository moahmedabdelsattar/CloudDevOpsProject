provider "aws" {
  region = var.region
}

module "network" {
  source = "./moduls/network"

  vpc_cidr = var.vpc_cidr
}

module "server" {
  source = "./moduls/server"

  subnet_id = module.network.public_subnet_id
  vpc_id    = module.network.vpc_id
}