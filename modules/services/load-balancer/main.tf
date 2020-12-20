##################################################################################
#  APPLICATION LOAD BALANCER
##################################################################################

resource "aws_lb" "app_lb" {
  name               = join("-", [var.name, "alb"])
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
    subnets             = [
        "${data.aws_subnet.public_nonprod_2a.id}",
        "${data.aws_subnet.public_nonprod_2b.id}",
        "${data.aws_subnet.public_nonprod_2c.id}"   
        ]

  enable_deletion_protection = true

  access_logs {
    bucket  = load_balancer_log_bucket.lb_logs.bucket
    prefix  = "app-servers-lb"
    enabled = true
  }

  tags = {
    Environment = var.environment
  }
}

##################################################################################
# LISTENERS
##################################################################################

resource "aws_lb_listener" "vault" {
  load_balancer_arn = "${aws_lb.s_vault_alb.arn}"
  port      = "80"
  protocol  = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

## LISTENER RULES
resource "aws_lb_listener_rule" "redirect_http_to_https" {
  listener_arn = "${aws_lb_listener.vault.arn}"

action {
    type = "redirect"

    redirect {
    port        = "443"
    protocol    = "HTTPS"
    status_code = "HTTP_301"
    }
}

condition {
    field  = "host-header"
    values = ["my-service.*.terraform.io"]
  }
}

resource "aws_lb_listener_rule" "health_check" {
  listener_arn = "${aws_lb_listener.vault.arn}"

action {
  type = "fixed-response"

  fixed_response {
  content_type = "text/plain"
  message_body = "HEALTHY"
  status_code  = "200"
  }
}

condition {
    field  = "path-pattern"
    values = ["/health"]
  }
}

##################################################################################
# LOAD BALANCER SECURITY GROUP
##################################################################################

module "load_balacer_security_group" {
  source        = "/modules/networking/security-groups/worker-servrs-lb"
  environment   = var.environment
  vpc_id        = var.vpc_id

}

##################################################################################
# LOAD BALANCER LOG S3 BUCKET
##################################################################################

module "load_balancer_log_bucket" {
	source          = "./modules/data/s3/lb-logs-bucket"
	target_bucket   = "application-servers-load-balancer-logs"
  target_prefix   = "NonProd-App-Servers-LB"
  aws_account		  = var.aws_account
  aws_account_id  = var.aws_account_id
  force_destroy   = true
  owner           = var.owner
  environment     = var.environment
}