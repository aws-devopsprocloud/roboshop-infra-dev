resource "aws_lb" "frontend_alb" {
  name               = "${local.name}-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.frontend_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.public_subnet_ids.value)

  enable_deletion_protection = false

  tags = merge(
    var.common_tags,
    var.tags,
    {
        Name = "${local.name}-frontend-alb"
    }
  )
}

resource "aws_lb_listener" "frontend_alb" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_ssm_parameter.frontend_alb_certificate_arn.value

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>This is a Fixed response content from Frontend ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "frontend_alb" {
  zone_id = var.zone_id # ID of your Route 53 zone
  name    = "*.${var.domain_name}" # *.devopsprocloud.in
  type    = "A"

  alias {
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
}

# #---------------------------------------------
# #                 TARGET GROUP               |
# #---------------------------------------------
# resource "aws_lb_target_group" "frontend" {
#   name     = "${local.name}-frontend-alb"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = data.aws_ssm_parameter.vpc_id.value

# health_check {
#   enabled             = true
#   path                = "/health"       # The endpoint to ping
#   port                = "80"   # Use the same port traffic is sent to
#   protocol            = "HTTP"
#   healthy_threshold   = 2               # Consecutive passes to be 'Healthy'
#   unhealthy_threshold = 3                # Consecutive failures to be 'Unhealthy'
#   timeout             = 5                # Seconds to wait for a response
#   interval            = 10               # Seconds between health checks
#   matcher             = "200-299"        # Expected HTTP response codes
# }
# }

# #---------------------------------------------
# #           Loadbalancer rule creation       |
# #---------------------------------------------
# resource "aws_lb_listener_rule" "frontend" {
#   listener_arn = aws_lb_listener.frontend_alb.arn

#   action {
#     type = "forward"
#     target_group_arn = aws_lb_target_group.frontend.arn
#   }
#   condition {
#     host_header {
#       values   = ["${var.environment}.${var.domain_name}"]
#     }
#   }
# }