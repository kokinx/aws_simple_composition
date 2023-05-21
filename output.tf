output "public_subnet_ids" {
  value = values(aws_subnet.public_subnets)[*].id
}

output "instance_ids" {
  value = aws_instance.ec2.*.id
}