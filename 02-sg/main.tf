
module "sg" {
  source = "git::https://github.com/aws-devopsprocloud/terraform-sg-module.git?ref=main"
  count = length(var.sg_names)
  sg_name = replace(var.sg_names[count.index], "_", "-")
  sg_description = "Allow TLS inbound on ${var.project} in ${var.environment} in ${var.sg_names[count.index]}"
  # vpc_id = var.sg_names[count.index] == "vpn" ? data.aws_vpc.default_vpc.id : data.aws_ssm_parameter.vpc_id.value
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  project = var.project
  environment = var.environment
}


# resource "aws_security_group_rule" "bastion_internet" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   cidr_blocks       = [local.my_ip]
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
# }

