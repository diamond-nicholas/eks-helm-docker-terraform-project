provider "aws" {
 region = "us-east-1"
 profile = "terraform-operator"
}

data "aws_availability_zones" "available" {
  
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"
  # insert the 23 required variables here
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"
  cluster_name = "awesome"
  subnets = #TODO
  vpc = #TODO
}