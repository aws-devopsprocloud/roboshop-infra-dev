

# #---------------------------------------------
# #                 INSTANCE CREATION           |
# #---------------------------------------------
# module "frontend" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   ami = data.aws_ami.rhel-9.id
#   name = "${var.project}-${var.environment}-${var.tags.Component}-AMI"

#   instance_type = "t3.micro"
#   subnet_id     = element(split(",", data.aws_ssm_parameter.private_subnet_ids.value),0)
#   vpc_security_group_ids = [data.aws_ssm_parameter.frontend_sg_id.value]
#   create_security_group = false

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#     Name = "${var.project}-${var.environment}-${var.tags.Component}"
#   }
# }

# #---------------------------------------------
# #                 INSTANCE PROVISIONING           |
# #---------------------------------------------
# resource "terraform_data" "frontend" {
#   # Changes to any instance of the cluster requires re-provisioning
#   triggers_replace = {
#     instance_id = module.frontend.id
#   }

#   # Bootstrap script can run on any instance of the cluster
#   # So we just choose the first in this case
#   connection {
#     host = module.frontend.private_ip
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
#       "sudo sh /tmp/bootstrap.sh ${var.tags.Component} ${var.environment}",
#     ]
#   }
# }

# # Stopping the instance 
# resource "aws_ec2_instance_state" "frontend" {
#   instance_id = module.frontend.id
#   state       = "stopped"
#   depends_on = [terraform_data.frontend]
# }


# #---------------------------------------------
# #                 AMI CREATION               |
# #---------------------------------------------

# resource "aws_ami_from_instance" "frontend" {
#   name               = "${var.project}-${var.environment}-${var.tags.Component}-${local.timestamp}"
#   source_instance_id = module.frontend.id
#   depends_on = [ aws_ec2_instance_state.frontend ]
# }

# #---------------------------------------------
# #               Launch Template              |
# #---------------------------------------------

# resource "aws_launch_template" "frontend" {
#   name = "${var.project}-${var.environment}-${var.tags.Component}"

#   image_id = aws_ami_from_instance.frontend.id

#   instance_initiated_shutdown_behavior = "terminate"

#   instance_type = "t3.micro"

#   vpc_security_group_ids = [data.aws_ssm_parameter.frontend_sg_id.value]
#   update_default_version = true

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "${var.project}-${var.environment}-${var.tags.Component}"
#     }
#   }
# }

# #---------------------------------------------
# #               Autoscaling Group            |
# #---------------------------------------------
# resource "aws_autoscaling_group" "frontend" {
#   name                      = "${var.project}-${var.environment}-${var.tags.Component}"
#   max_size                  = 10
#   min_size                  = 1
#   health_check_grace_period = 60
#   health_check_type         = "ELB"
#   desired_capacity          = 2
#   vpc_zone_identifier       = [data.aws_ssm_parameter.private_subnet_ids.value]
#   target_group_arns = [aws_lb_target_group.frontend.arn]


#   instance_refresh {
#     strategy = "Rolling"
#     preferences {
#       min_healthy_percentage = 50
#     }
#     triggers = ["launch_template"]
#   }

#   launch_template {
#     id      = aws_launch_template.frontend.id
#     version = aws_launch_template.frontend.latest_version
#   }

#   tag {
#     key                 = "Name"
#     value               = "${var.project}-${var.environment}-${var.tags.Component}"
#     propagate_at_launch = true
#   }

#   timeouts {
#     delete = "15m"
#   }
# }


# #---------------------------------------------
# #           Autoscaling Group Policy         |
# #---------------------------------------------
# resource "aws_autoscaling_policy" "frontend" {
#  autoscaling_group_name = aws_autoscaling_group.frontend.name
#   name                   = "${var.project}-${var.environment}-${var.tags.Component}"
#   policy_type            = "TargetTrackingScaling"
#   estimated_instance_warmup = 120

# target_tracking_configuration {
    
#     predefined_metric_specification {
#     predefined_metric_type = "ASGAverageCPUUtilization"
#     }

#     target_value = 5.0
# }
# }

# #---------------------------------------------
# #              INSTANCE DELETION             |
# #---------------------------------------------
# resource "terraform_data" "frontend_delete" {
#   # Changes to any instance of the cluster requires re-provisioning
#   triggers_replace =  [module.frontend.id]
#   depends_on = [aws_autoscaling_policy.frontend]

#   provisioner "local-exec" {
#     # Bootstrap script called with private_ip of each node in the cluster
#     command = "aws ec2 terminate-instances --instance-ids ${module.frontend.id}"
#   }
# }



