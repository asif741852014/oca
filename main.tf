module "vpc" {
    source = "./modules/vpc"
    vpcidr = var.vpccidr
    vpcname = var.vpcname
    igw =  var.igw
    subnetcidr_az1 =  var.subnetcidr_az1
   subnetcidr_az2 = var.subnetcidr_az2
}

module "sg" {
    source = "./modules/sg"
    vpc_id = module.vpc.vpc_id
  
}




#fetch keyapair

module "key" {
    source = "./modules/key"
}


module "iam" {
  source = "./modules/IAM"
}

# Creating EKS Cluster
module "eks" {
  source                = "./modules/eks"
  master_arn            = module.iam.master_arn
  worker_arn            = module.iam.worker_arn
  public_subnet_az1_id  = module.vpc.s1
  public_subnet_az2_id  = module.vpc.s2
  eks_security_group_id = module.sg_id
  key_name = module.key.lal
  instance_size         = var.instance_size
  worker_node_count                 = var.instance_count
}