resource "aws_lb" "kk_lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.kk_sg.id]
  subnets            = [aws_subnet.kk_publicsubnet.id, aws_subnet.kk_privatesubnet.id]

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "kk_listener" {
  load_balancer_arn = aws_lb.kk_lb.arn
  port              = "80"
  protocol          = "HTTP"
   default_action {
         type = "forward"
        
          forward {
             target_group {
                arn = aws_lb_target_group.kk_tg.arn
                }
               
  }
}
}