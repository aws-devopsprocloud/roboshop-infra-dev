resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}/vpc_id"
  type  = "String"
  value = module.roboshop.vpc_id
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project}/${var.environment}/public_subnet_ids"
  type  = "String"
  value = join(",", module.roboshop.public_subnet_ids)
}

# Error: Incorrect attribute value type
# │
# │   on parameters.tf line 10, in resource "aws_ssm_parameter" "public_subnet_ids":
# │   10:   value = module.roboshop.public_subnet_ids
# │     ├────────────────
# │     │ module.roboshop.public_subnet_ids is tuple with 2 elements
# │
# │ Inappropriate value for attribute "value": string required, but have tuple.

# Terraform has this value ad it is a list
# 123-gsjhknc,
#124-jnflwkmflw

# AWS is expecting the following values/type in SSM parameter 123-gsjhknc,124-jnflwkmflw


# We need to use join function to join the valiues in order to store the values in SSM Parameters store 


resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project}/${var.environment}/private_subnet_ids"
  type  = "String"
  value = join(",", module.roboshop.private_subnet_ids)
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project}/${var.environment}/database_subnet_ids"
  type  = "String"
  value = join(",", module.roboshop.database_subnet_ids)
}

resource "aws_ssm_parameter" "eip_id" {
  name  = "/${var.project}/${var.environment}/eip_id"
  type  = "String"
  value = module.roboshop.eip_id
}

resource "aws_ssm_parameter" "ngw_id" {
  name  = "/${var.project}/${var.environment}/ngw_id"
  type  = "String"
  value = module.roboshop.ngw_id
}

resource "aws_ssm_parameter" "public_rtb_id" {
  name  = "/${var.project}/${var.environment}/public_rtb_id"
  type  = "String"
  value = module.roboshop.public_rtb_id
}

resource "aws_ssm_parameter" "private_rtb_id" {
  name  = "/${var.project}/${var.environment}/private_rtb_id"
  type  = "String"
  value = module.roboshop.private_rtb_id
}

resource "aws_ssm_parameter" "database_rtb_id" {
  name  = "/${var.project}/${var.environment}/database_rtb_id"
  type  = "String"
  value = module.roboshop.database_rtb_id
}

resource "aws_ssm_parameter" "peering_connection_id" {
  name  = "/${var.project}/${var.environment}/peering_connection_id"
  type  = "String"
  value = module.roboshop.peering_connection_id
}


