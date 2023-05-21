#EC2
resource "aws_instance" "ec2" {
  count         = length(var.public_subnets.subnets)
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(values(aws_subnet.public_subnets)[*].id, count.index % 2)
  #subnet_id = var.subnet_ids[0]
  key_name = aws_key_pair.key_pair.id

  tags = {
    Name = "${var.project}-${var.env}-web0${count.index + 1}"
  }

  #  vpc_security_group_ids = [
  #    var.vpc_security_group
  #  ]

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }
}

#Elastic IP
resource "aws_eip" "eip" {
  vpc      = true
  count    = length(aws_instance.ec2)
  instance = element(aws_instance.ec2.*.id, count.index + 1)

  tags = {
    Name = "${var.project}-${var.env}-eip0${count.index + 1}"
  }
}

#Key Pair
resource "aws_key_pair" "key_pair" {
  key_name   = "${var.project}-${var.env}-key"
  public_key = file(var.public_key_path)
}