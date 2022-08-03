provider "aws" {
 region = "us-east-1"
 profile = "terraform-operator"
}

data "aws_availability_zones" "available" {
  
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"
  name = "vpc-awesome"
  cidr = "10.0.0.0/16"
  azs = data.aws_availability_zones.available.names
  public_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
   "kubernetes.io/cluster/awesome" = "shared"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"
  cluster_name = "awesome"
  subnet_ids = module.vpc.public_subnets
  vpc_id = module.vpc.vpc_id
}