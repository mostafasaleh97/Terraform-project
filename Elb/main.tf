resource "aws_lb" "test" {
  name               = var.load-name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [var.load-security]
  subnets            = var.subnets

  enable_deletion_protection = false

}

resource "aws_lb_target_group" "test" {
  name     = var.target-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.load-vpc
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
 


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}
resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = aws_lb_target_group.test.arn
  count = length(var.ec2-id)
  target_id        = var.ec2-id[count.index]
  port             = 80
}