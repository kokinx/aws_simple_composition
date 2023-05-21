variable "project" {}
variable "env" {}
variable "vpc_cidr" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "public_key_path" {
  default = "./.ssh/public_key.tfvars"
}
variable "ami" {}
variable "instance_type" {}
variable "volume_type" {}
variable "volume_size" {}
variable "public_subnet_ids" {}
variable "instance_ids" {}