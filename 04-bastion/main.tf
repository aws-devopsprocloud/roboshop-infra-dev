module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.rhel-9.id
  name = "${var.project}-${var.environment}-bastion"

  instance_type = "t3.small"
  subnet_id     = local.public_subnet_id
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
  create_security_group = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "${var.project}-${var.environment}-mongodb"
  }
}