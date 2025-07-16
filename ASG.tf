resource "aws_autoscaling_group" "lasya_ASG" {
  max_size = 3
  min_size = 2
  desired_capacity = 2
  name="lasya-ASG"
  target_group_arns =[aws_lb_target_group.lasya_tg.arn]
  vpc_zone_identifier = aws_subnet.public1[*].id
  launch_template {
    id=aws_launch_template.lasya_tmt.id
    version="$Latest"
    
  }
  health_check_type = "EC2"
}