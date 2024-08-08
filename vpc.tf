provider "aws" {
    region = var.region
}
data "aws_availability_zones" "all-zones" {}

resource "random_string" "suffix" {
    length = 8
    special = false   
}

locals {
  cluster_name = "demo-EKS_cluster-${random_string.suffix.result}"
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.0"

  name = "demo-vpc"
  cidr = var.vpc_cidr
  azs = data.aws_availability_zones.all-zones.names
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}
