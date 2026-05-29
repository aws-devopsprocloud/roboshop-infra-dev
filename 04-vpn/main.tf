module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.openvpn.id
  name = "${var.project}-${var.environment}-vpn"

  instance_type = "t3.micro"
  subnet_id     = local.public_subnet_id
  #subnet_id     = data.aws_subnet.default_vpc_subnet.id
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  create_security_group = false
  user_data = file("vpn.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "${var.project}-${var.environment}-vpn"
  }
}

