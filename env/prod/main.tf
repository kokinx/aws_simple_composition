module "prod" {
  source = "../../"

  project         = var.project
  env             = var.env
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  public_subnet_ids  = module.prod.public_subnet_ids
  public_key_path = "../../.ssh/public_key.tfvars"
  ami             = "ami-08928044842b396f0"
  instance_type   = "t2.micro"
  volume_type     = "gp2"
  volume_size     = 8
  instance_ids = module.prod.instance_ids
}