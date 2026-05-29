
module "mongodb" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.rhel-9.id
  name = "${var.project}-${var.environment}-mongodb"

  instance_type = "t3.micro"
  subnet_id     = local.database_subnet_id
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id.value]
  create_security_group = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "${var.project}-${var.environment}-mongodb"
  }
}

resource "null_resource" "mongodb" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    instance_id = module.mongodb.id
  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    host = module.mongodb.private_ip
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    
  }
  
  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }


  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mongodb dev",
    ]
  }
}


# module "redis" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   ami = data.aws_ami.rhel-9.id
#   name = "${var.project}-${var.environment}-redis"

#   instance_type = "t3.micro"
#   subnet_id     = local.database_subnet_id
#   vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg_id.value]
#   create_security_group = false

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#     Name = "${var.project}-${var.environment}-redis"
#   }
# }

# resource "null_resource" "redis" {
#   # Changes to any instance of the cluster requires re-provisioning
#   triggers = {
#     instance_id = module.redis.id
#   }

#   # Bootstrap script can run on any instance of the cluster
#   # So we just choose the first in this case
#   connection {
#     host = module.redis.private_ip
#     type = "ssh"
#     user = "ec2-user"
#     password = "DevOps321"
    
#   }
  
#   provisioner "file" {
#     source = "bootstrap.sh"
#     destination = "/tmp/bootstrap.sh"
#   }


#   provisioner "remote-exec" {
#     # Bootstrap script called with private_ip of each node in the cluster
#     inline = [
#       "chmod +x /tmp/bootstrap.sh",
#       "sudo sh /tmp/bootstrap.sh redis dev",
#     ]
#   }
# }



# module "mysql" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   ami = data.aws_ami.rhel-9.id
#   name = "${var.project}-${var.environment}-mysql"

#   instance_type = "t3.micro"
#   subnet_id     = local.database_subnet_id
#   vpc_security_group_ids = [data.aws_ssm_parameter.mysql_sg_id.value]
#   create_security_group = false
#   iam_instance_profile = "EC2-Full-Access-Role"
#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#     Name = "${var.project}-${var.environment}-mysql"
#   }
# }

# resource "null_resource" "mysql" {
#   # Changes to any instance of the cluster requires re-provisioning
#   triggers = {
#     instance_id = module.mysql.id
#   }

#   # Bootstrap script can run on any instance of the cluster
#   # So we just choose the first in this case
#   connection {
#     host = module.mysql.private_ip
#     type = "ssh"
#     user = "ec2-user"
#     password = "DevOps321"
    
#   }
  
#   provisioner "file" {
#     source = "bootstrap.sh"
#     destination = "/tmp/bootstrap.sh"
#   }


#   provisioner "remote-exec" {
#     # Bootstrap script called with private_ip of each node in the cluster
#     inline = [
#       "chmod +x /tmp/bootstrap.sh",
#       "sudo sh /tmp/bootstrap.sh mysql dev",
#     ]
#   }
# }

# module "rabbitmq" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   ami = data.aws_ami.rhel-9.id
#   name = "${var.project}-${var.environment}-rabbitmq"

#   instance_type = "t3.micro"
#   subnet_id     = local.database_subnet_id
#   vpc_security_group_ids = [data.aws_ssm_parameter.rabbitmq_sg_id.value]
#   create_security_group = false
#   iam_instance_profile = "EC2-Full-Access-Role"
#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#     Name = "${var.project}-${var.environment}-rabbitmq"
#   }
# }

# resource "null_resource" "rabbitmq" {
#   # Changes to any instance of the cluster requires re-provisioning
#   triggers = {
#     instance_id = module.rabbitmq.id
#   }

#   # Bootstrap script can run on any instance of the cluster
#   # So we just choose the first in this case
#   connection {
#     host = module.rabbitmq.private_ip
#     type = "ssh"
#     user = "ec2-user"
#     password = "DevOps321"
    
#   }
  
#   provisioner "file" {
#     source = "bootstrap.sh"
#     destination = "/tmp/bootstrap.sh"
#   }


#   provisioner "remote-exec" {
#     # Bootstrap script called with private_ip of each node in the cluster
#     inline = [
#       "chmod +x /tmp/bootstrap.sh",
#       "sudo sh /tmp/bootstrap.sh rabbitmq dev",
#     ]
#   }
# }


# resource "aws_route53_record" "mongodb" {
#   zone_id = var.zone_id
#   name    = "mongodb-${var.environment}.${var.domain_name}"
#   type    = "A"
#   ttl     = "1"
#   records = [module.mongodb.private_ip]
#   allow_overwrite = true
# }

# resource "aws_route53_record" "redis" {
#   zone_id = var.zone_id
#   name    = "redis-${var.environment}.${var.domain_name}"
#   type    = "A"
#   ttl     = "1"
#   records = [module.redis.private_ip]
#   allow_overwrite = true
# }

# resource "aws_route53_record" "mysql" {
#   zone_id = var.zone_id
#   name    = "mysql-${var.environment}.${var.domain_name}"
#   type    = "A"
#   ttl     = "1"
#   records = [module.mysql.private_ip]
#   allow_overwrite = true
# }

# resource "aws_route53_record" "rabbitmq" {
#   zone_id = var.zone_id
#   name    = "rabbitmq-${var.environment}.${var.domain_name}"
#   type    = "A"
#   ttl     = "1"
#   records = [module.rabbitmq.private_ip]
#   allow_overwrite = true
# }

