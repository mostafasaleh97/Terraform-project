resource "aws_security_group" "mysecurity" {
  name        = "allow_tls"
  description = "Allow All inbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "mysecurity"
  }
}