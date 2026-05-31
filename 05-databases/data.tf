data "aws_ami" "rhel-9" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_ssm_parameter" "bastion_public_ip" {
  name = "/${var.project}/${var.environment}/bastion_public_ip"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project}/${var.environment}/database_subnet_ids"
}

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project}/${var.environment}/vpn_sg_id"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project}/${var.environment}/mongodb_sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.project}/${var.environment}/redis_sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project}/${var.environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/${var.project}/${var.environment}/rabbitmq_sg_id"
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project}/${var.environment}/catalogue_sg_id"
}

data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.project}/${var.environment}/user_sg_id"
}

data "aws_ssm_parameter" "cart_sg_id" {
  name = "/${var.project}/${var.environment}/cart_sg_id"
}

data "aws_ssm_parameter" "shipping_sg_id" {
  name = "/${var.project}/${var.environment}/shipping_sg_id"
}

data "aws_ssm_parameter" "payment_sg_id" {
  name = "/${var.project}/${var.environment}/payment_sg_id"
}

data "aws_ssm_parameter" "frontend_sg_id" {
  name = "/${var.project}/${var.environment}/frontend_sg_id"
}

#Get ec2 and bastion credentials
data "aws_ssm_parameter" "ec2_user" {
  name = "/${var.project}/${var.environment}/ec2_user"
}

data "aws_ssm_parameter" "ec2_password" {
  name = "/${var.project}/${var.environment}/ec2_password"
}

data "aws_ssm_parameter" "bastion_user" {
  name = "/${var.project}/${var.environment}/bastion_user"
}

data "aws_ssm_parameter" "bastion_password" {
  name = "/${var.project}/${var.environment}/bastion_password"
}