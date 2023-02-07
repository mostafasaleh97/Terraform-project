module "publicload" {
    source = "./Elb"
    load-name = "public-load"
    internal = false
    load-security = module.newsecurity.security-id
    load-vpc = module.newvpc.vpc-id
    target-name = "public-target"
    subnets = [ module.newvpc.subnet-id1,module.newvpc.subnet-id2]
    ec2-id = [module.publicinstance1.myid,module.publicinstance2.myid]
}
module "privateload" {
    source = "./Elb"
    internal = true
    load-name = "private-load"
    load-security = module.newsecurity.security-id
    load-vpc = module.newvpc.vpc-id
    target-name = "private-target"
    subnets = [module.newvpc.subnet-id3,module.newvpc.subnet-id4]
    ec2-id = [module.privateinstance1.myid,module.privateinstance2.myid]
}