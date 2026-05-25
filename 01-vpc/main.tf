#-------------------------
#           VPC           |
#-------------------------

module "roboshop" {
  source = "git::https://github.com/aws-devopsprocloud/terraform-vpc-module.git?ref=main"
  project = var.project
  environment = var.environment 
  common_tags = var.common_tags
  public_subnets_cidr = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  database_subnets_cidr = var.database_subnets_cidr
  is_peering_required = var.is_peering_required
}