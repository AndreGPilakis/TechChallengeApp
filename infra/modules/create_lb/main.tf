variable "vpc_id"{
    type = string
}

variable "sg_id"{
  type = string
}

variable "ec2_id"{
  type = string
}
variable "public_subnet_1_id" {
  type = string
}

variable "public_subnet_2_id" {
  type = string
}

variable "public_subnet_3_id" {
  type = string
}

resource "aws_lb_target_group" "web" {
  name     = "tech-challenge-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  }

resource "aws_lb_target_group_attachment" "web_attachement" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = var.ec2_id
  port             = 80
}

resource "aws_lb" "public_lb" {
  name               = "tech-test-app"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = [var.public_subnet_1_id,var.public_subnet_2_id,var.public_subnet_3_id]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.public_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}
