resource "aws_launch_configuration" "custom_launch_configuration" {
  name   = "custom-launch-configuration"
  image_id      =  var.ami
  instance_type = var.instance_type
#   user_data = data.template_file.user_data.rendered
#   key_name = "dev-account"
#   associate_public_ip_address = true
 security_groups    = [aws_security_group.kk_sg.id]
  
  #lifecycle {
  #  create_before_destroy = true
  #}
}

######## autoscaling group################

resource "aws_autoscaling_group" "custom-group-autoscaling" {
  name                      = "custom-group-autoscaling"
  desired_capacity   = 3
  max_size           = 5
  min_size           = 1
  launch_configuration      = aws_launch_configuration.custom_launch_configuration.id
  vpc_zone_identifier       = [aws_subnet.kk_publicsubnet.id, aws_subnet.kk_privatesubnet.id]
}