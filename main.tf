provider "aws" {
 region = "us-east-1"
 profile = "terraform-operator"
}

data "aws_availability_zones" "available" {
  
}

output "AZs" {
  value= data.aws_availability_zones.available.names
  description= "list of aws availability zones within the region"
}