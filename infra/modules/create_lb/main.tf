variable "vpc_id"{
    type = string
}

resource "aws_lb_target_group" "tech_challenge_app" {
  name     = "tech_challenge_target_group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  }

resource "aws_lb_target_group_attachment" "web_attachement" {
  target_group_arn = aws_lb_target_group.tech_challenge_app.arn
  target_id        = aws_instance.web.id
  port             = 80
}



