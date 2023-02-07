module "publicinstance1" {
    source = "./ec2"
    public-ip = true
    instance-name = "public1"
    instance-type = "t2.micro"
    key-name = "newkey1"
    subnet_id = module.newvpc.subnet-id1
    security-Name = module.newsecurity.security-id
    dependency = module.newvpc.dependent
    no = 1

  
}
module "publicinstance2" {
    
    source = "./ec2"
    public-ip = true
    instance-name = "public2"
    instance-type = "t2.micro"
    key-name = "newkey2"
    subnet_id = module.newvpc.subnet-id2
    security-Name = module.newsecurity.security-id
    dependency = module.newvpc.dependent
    no = 2
  
   
   
}
module "privateinstance1" {
    source = "./ec2-private"
    public-ip = false
    instance-name = "private1"
    instance-type = "t2.micro"
    key-name = "newkey3"
    subnet_id = module.newvpc.subnet-id3
    data = "${file("userdata.sh")}"
    security-Name = module.newsecurity.security-id
    dependency = module.newvpc.dependent
    no = 1
   
  
}
module "privateinstance2" {
    
    source = "./ec2-private"
    public-ip = false
    instance-name = "private2"
    instance-type = "t2.micro"
    key-name = "newkey4"
    subnet_id = module.newvpc.subnet-id4
    data = "${file("userdata.sh")}"
    security-Name = module.newsecurity.security-id
    dependency = module.newvpc.dependent
    no = 2
    
}
