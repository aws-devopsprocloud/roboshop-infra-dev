
#---------------------------
#           OLD            |
#---------------------------
# resource "aws_security_group_rule" "vpn_public_443" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   # Where traffic is coming from
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
# }

# # Admin UI
# resource "aws_security_group_rule" "vpn_public_943" {
#   type              = "ingress"
#   from_port         = 943
#   to_port           = 943
#   protocol          = "tcp"
#   # Where traffic is coming from
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
# }

# resource "aws_security_group_rule" "backend_alb_vpn" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
# }

# resource "aws_security_group_rule" "mongodb_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
# }


# resource "aws_security_group_rule" "mongodb_catalogue" {
#   type              = "ingress"
#   from_port         = 27017
#   to_port           = 27017
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
# }

# resource "aws_security_group_rule" "mongodb_user" {
#   type              = "ingress"
#   from_port         = 27017
#   to_port           = 27017
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.user_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
# }

# resource "aws_security_group_rule" "redis_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.redis_sg_id.value
# }


# resource "aws_security_group_rule" "redis_user" {
#   type              = "ingress"
#   from_port         = 6379
#   to_port           = 6379
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.user_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.redis_sg_id.value
# }

# resource "aws_security_group_rule" "redis_cart" {
#   type              = "ingress"
#   from_port         = 6379
#   to_port           = 6379
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.redis_sg_id.value
# }

# resource "aws_security_group_rule" "mysql_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
# }

# resource "aws_security_group_rule" "mysql_shipping" {
#   type              = "ingress"
#   from_port         = 3306
#   to_port           = 3306
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
# }

# resource "aws_security_group_rule" "rabbitmq_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
# }

# resource "aws_security_group_rule" "rabbitmq_payment" {
#   type              = "ingress"
#   from_port         = 5672
#   to_port           = 5672
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
# }

# resource "aws_security_group_rule" "catalogue_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
# }

# # resource "aws_security_group_rule" "catalogue_frontend" {
# #   type              = "ingress"
# #   from_port         = 8080
# #   to_port           = 8080
# #   protocol          = "tcp"
# #   #cidr_blocks       = ["0.0.0.0/0"]
# #   source_security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
# #   # which SG you are creating this rule
# #   security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
# # }

# resource "aws_security_group_rule" "catalogue_backend_alb" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
# }

# resource "aws_security_group_rule" "catalogue_cart" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
# }

# resource "aws_security_group_rule" "cart_catalogue" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.cart_sg_id.value
# }

# resource "aws_security_group_rule" "user_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.user_sg_id.value
# }

# # resource "aws_security_group_rule" "user_frontend" {
# #   type              = "ingress"
# #   from_port         = 8080
# #   to_port           = 8080
# #   protocol          = "tcp"
# #   #cidr_blocks       = ["0.0.0.0/0"]
# #   source_security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
# #   # which SG you are creating this rule
# #   security_group_id = data.aws_ssm_parameter.user_sg_id.value
# # }

# resource "aws_security_group_rule" "user_backend_alb" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.user_sg_id.value
# }

# # resource "aws_security_group_rule" "user_payment" {
# #   type              = "ingress"
# #   from_port         = 8080
# #   to_port           = 8080
# #   protocol          = "tcp"
# #   #cidr_blocks       = ["0.0.0.0/0"]
# #   source_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
# #   # which SG you are creating this rule
# #   security_group_id = data.aws_ssm_parameter.user_sg_id.value
# # }

# resource "aws_security_group_rule" "cart_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.cart_sg_id.value
# }

# # resource "aws_security_group_rule" "cart_frontend" {
# #   type              = "ingress"
# #   from_port         = 8080
# #   to_port           = 8080
# #   protocol          = "tcp"
# #   #cidr_blocks       = ["0.0.0.0/0"]
# #   source_security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
# #   # which SG you are creating this rule
# #   security_group_id = data.aws_ssm_parameter.cart_sg_id.value
# # }

# resource "aws_security_group_rule" "cart_backend_alb" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.cart_sg_id.value
# }

# # resource "aws_security_group_rule" "cart_shipping" {
# #   type              = "ingress"
# #   from_port         = 8080
# #   to_port           = 8080
# #   protocol          = "tcp"
# #   #cidr_blocks       = ["0.0.0.0/0"]
# #   source_security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
# #   # which SG you are creating this rule
# #   security_group_id = data.aws_ssm_parameter.cart_sg_id.value
# # }

# # resource "aws_security_group_rule" "cart_payment" {
# #   type              = "ingress"
# #   from_port         = 8080
# #   to_port           = 8080
# #   protocol          = "tcp"
# #   #cidr_blocks       = ["0.0.0.0/0"]
# #   source_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
# #   # which SG you are creating this rule
# #   security_group_id = data.aws_ssm_parameter.cart_sg_id.value
# # }


# resource "aws_security_group_rule" "shipping_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
# }

# # resource "aws_security_group_rule" "shipping_frontend" {
# #   type              = "ingress"
# #   from_port         = 8080
# #   to_port           = 8080
# #   protocol          = "tcp"
# #   #cidr_blocks       = ["0.0.0.0/0"]
# #   source_security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
# #   # which SG you are creating this rule
# #   security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
# # }

# resource "aws_security_group_rule" "shipping_backend_alb" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
# }

# resource "aws_security_group_rule" "payment_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.payment_sg_id.value
# }

# # resource "aws_security_group_rule" "payment_frontend" {
# #   type              = "ingress"
# #   from_port         = 8080
# #   to_port           = 8080
# #   protocol          = "tcp"
# #   #cidr_blocks       = ["0.0.0.0/0"]
# #   source_security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
# #   # which SG you are creating this rule
# #   security_group_id = data.aws_ssm_parameter.payment_sg_id.value
# # }

# resource "aws_security_group_rule" "payment_backend_alb" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.payment_sg_id.value
# }

# resource "aws_security_group_rule" "frontend_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
# }


# resource "aws_security_group_rule" "frontend_alb_internet" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
# }


# resource "aws_security_group_rule" "frontend_frontend_alb" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   # which SG you are creating this rule
#   source_security_group_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
#   security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
# }


# #-------------------
# #-------------------
# #-------------------

# resource "aws_security_group_rule" "backend_alb_catalogue" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   # Where traffic is coming from
#   source_security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
#   security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
# }

# resource "aws_security_group_rule" "backend_alb_user" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   # Where traffic is coming from
#   source_security_group_id = data.aws_ssm_parameter.user_sg_id.value
#   security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
# }

# resource "aws_security_group_rule" "backend_alb_cart" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   # Where traffic is coming from
#   source_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
#   security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
# }

# resource "aws_security_group_rule" "backend_alb_shipping" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   # Where traffic is coming from
#   source_security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
#   security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
# }

# resource "aws_security_group_rule" "backend_alb_payment" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   # Where traffic is coming from
#   source_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
#   security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
# }

# resource "aws_security_group_rule" "backend_alb_frontend" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   # Where traffic is coming from
#   source_security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
#   security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
# }
# Bastion
resource "aws_security_group_rule" "bastion_internet" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  cidr_blocks       = [local.my_ip]
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
}

#---------------------------
#           NEW            |
#---------------------------
resource "aws_security_group_rule" "vpn_public_443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  # Where traffic is coming from
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
}

# Admin UI
resource "aws_security_group_rule" "vpn_public_943" {
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  # Where traffic is coming from
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
}


# NOT REQUIRED
resource "aws_security_group_rule" "backend_alb_vpn" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

# resource "aws_security_group_rule" "mongodb_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
# }
# NEW BASTION to MONGODB
resource "aws_security_group_rule" "mongodb_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}


resource "aws_security_group_rule" "mongodb_catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}

resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.user_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}

# resource "aws_security_group_rule" "redis_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.redis_sg_id.value
# }

resource "aws_security_group_rule" "redis_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}

resource "aws_security_group_rule" "redis_user" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.user_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}

resource "aws_security_group_rule" "redis_cart" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}

# resource "aws_security_group_rule" "mysql_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
# }

resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
}

resource "aws_security_group_rule" "mysql_shipping" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
}

# resource "aws_security_group_rule" "rabbitmq_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
# }

resource "aws_security_group_rule" "rabbitmq_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
}

# resource "aws_security_group_rule" "catalogue_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
# }

resource "aws_security_group_rule" "catalogue_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
}
# resource "aws_security_group_rule" "catalogue_frontend" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
# }

resource "aws_security_group_rule" "catalogue_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
}

# NOT REQUIRED
resource "aws_security_group_rule" "catalogue_cart" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
}

# NOT REQUIRED
resource "aws_security_group_rule" "cart_catalogue" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
}

# resource "aws_security_group_rule" "user_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.user_sg_id.value
# }

resource "aws_security_group_rule" "user_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.user_sg_id.value
}

resource "aws_security_group_rule" "user_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.user_sg_id.value
}

# resource "aws_security_group_rule" "cart_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.cart_sg_id.value
# }

resource "aws_security_group_rule" "cart_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
}

resource "aws_security_group_rule" "cart_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
}

# resource "aws_security_group_rule" "shipping_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
# }

resource "aws_security_group_rule" "shipping_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
}

resource "aws_security_group_rule" "shipping_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
}

# resource "aws_security_group_rule" "payment_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.payment_sg_id.value
# }

resource "aws_security_group_rule" "payment_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.payment_sg_id.value
}


resource "aws_security_group_rule" "payment_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.payment_sg_id.value
}

# resource "aws_security_group_rule" "frontend_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   # which SG you are creating this rule
#   security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
# }

resource "aws_security_group_rule" "frontend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
}

resource "aws_security_group_rule" "frontend_alb_internet" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  # which SG you are creating this rule
  security_group_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
}


resource "aws_security_group_rule" "frontend_frontend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # which SG you are creating this rule
  source_security_group_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
  security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
}


#-------------------
#-------------------
#-------------------

resource "aws_security_group_rule" "backend_alb_catalogue" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

resource "aws_security_group_rule" "backend_alb_user" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = data.aws_ssm_parameter.user_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

resource "aws_security_group_rule" "backend_alb_cart" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = data.aws_ssm_parameter.cart_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = data.aws_ssm_parameter.payment_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

resource "aws_security_group_rule" "backend_alb_frontend" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # Where traffic is coming from
  source_security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}