// ALB
resource "aws_lb" "lasya_alb" {
    name=local.resource_name
    load_balancer_type = "application"
    internal = false
    security_groups = [aws_security_group.sg.id]
    subnets = [aws_subnet.public1.id , aws_subnet.public2.id]
    depends_on = [ aws_internet_gateway.igw ]
  
}
// Targrt Group
resource "aws_lb_target_group" "lasya_tg" {
  name=local.resource_name
  port="80"
  protocol = "HTTP"
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    {
        Name="${local.resource_name}-TG"
    }
  )
}
// ALB Listener
resource "aws_lb_listener" "alb_ln" {
  load_balancer_arn=aws_lb.lasya_alb.arn
  port="80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lasya_tg.arn
    
  }
  tags = merge(
    var.common_tags,
    {
        Name="${local.resource_name}-Listener"
    }
  )
}