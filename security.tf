module "newsecurity" {
  source = "./sec"
  vpc-id = module.newvpc.vpc-id
} 