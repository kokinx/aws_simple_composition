module "network" {
    source = "../modules/network"

    project = var.project
    env = var.env
    vpc_cidr = "10.0.0.0/16"
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
}

