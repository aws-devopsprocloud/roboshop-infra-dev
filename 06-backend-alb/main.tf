resource "aws_lb" "backend_alb" {
  name               = "${local.name}-backend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.backend_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.private_subnet_ids.value)

  enable_deletion_protection = false

  tags = merge(
    var.common_tags,
    var.tags,
    {
        Name = "${local.name}-backend-alb"
    }
  )
}

resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>This is a Fixed response content from Backedn ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "backend" {
  zone_id = var.zone_id # ID of your Route 53 zone
  name    = "*.backend-alb-${var.environment}.${var.domain_name}" # *.backend-alb-dev.devopsprocloud.in
  type    = "A"

  alias {
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
}

