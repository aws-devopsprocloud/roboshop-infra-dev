data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.environment}/vpc_id"
}

# data "aws_ssm_parameter" "bastion_sg_id" {
#   name = "/${var.project}/${var.environment}/bastion_sg_id"
# }

data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_vpc" "default_vpc" {
  default = true
}