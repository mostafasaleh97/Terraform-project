module "newvpc" {
  source = "./vpc"
  vpc-cidr = "10.0.0.0/16"
  vpc-name = "newvpc"
  subnet-names = ["public1","public2","private1","private2"]
  subnet-cidr= ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24"]
  route-cidr = "0.0.0.0/0"
  route-names = ["public_route","private_route"]
  elastic-names = ["myel",]
  nat-names = ["mynat",]
  availability_zone = ["us-west-1b","us-west-1c","us-west-1b","us-west-1c"]

}