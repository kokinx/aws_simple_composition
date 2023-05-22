#Security Group for internal traffic
resource "aws_security_group" "common" {
  vpc_id = aws_vpc.vpc.id

  ##internal
  ingress {
    cidr_blocks = ["${var.vpc_cidr}"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "${var.project}-${var.env}-common-sg"
  }
}

#Security Group for Web instance
resource "aws_security_group" "ec2" {
  vpc_id = aws_vpc.vpc.id

  ##ssh
  ingress {
    cidr_blocks = [var.ec2_ip_ingress_cidr_blocks]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ##all_out
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "${var.project}-${var.env}-ec2-sg"
  }
}

#Security Group for alb
resource "aws_security_group" "alb" {
  vpc_id = aws_vpc.vpc.id

  ##HTTP
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ##HTTPS
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  ##all_out
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "${var.project}-${var.env}-alb-sg"
  }
}

#Security Group form rds
resource "aws_security_group" "rds" {
  vpc_id = aws_vpc.vpc.id

  ##internal
  ingress {
    cidr_blocks = ["${var.vpc_cidr}"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ##all_out
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

}