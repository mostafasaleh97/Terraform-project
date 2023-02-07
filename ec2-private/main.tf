resource "tls_private_key" "newkey" {
algorithm = "RSA"
rsa_bits  = 4096
}
resource "local_file" "newkey" {
content  = tls_private_key.newkey.private_key_pem
filename = var.key-name
file_permission = "0400"
}

resource "aws_key_pair" "firstkey" {
  key_name   = var.key-name
  public_key = tls_private_key.newkey.public_key_openssh
  

}
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
        name   = "virtualization-type"
        values = ["hvm"]
  }
}
resource "aws_instance" "privateinstance" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance-type
    subnet_id = var.subnet_id
    key_name = aws_key_pair.firstkey.key_name
    security_groups = [var.security-Name]
    associate_public_ip_address = var.public-ip
    user_data = var.data
    provisioner "local-exec" {
        command = "echo privte-ip${var.no}: ${self.private_ip} >> ./all-ips.txt"
    }
   
    depends_on = [
      var.dependency
    ]
    
    tags = {
        Name = var.instance-name
    }
 
    
}

