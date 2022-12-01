# #####################################################################
# ## AWS Target Group
# #####################################################################

# resource "aws_lb_target_group" "tcw_tg" {
# name = "tcw-tg"
# port = 80
# protocol = "HTTP"
# vpc_id = data.aws_vpc.vpc_available.id
# }


resource "aws_lb_target_group" "kk_tg" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.kk_vpc.id
  deregistration_delay = 30
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.custom-group-autoscaling.id
  lb_target_group_arn    = aws_lb_target_group.kk_tg.arn
}