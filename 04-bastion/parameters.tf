resource "aws_ssm_parameter" "bastion_public_ip" {
  name = "/${var.project}/${var.environment}/bastion_public_ip"
  type = "String" 
  value = module.bastion.public_ip
}