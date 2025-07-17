locals {
  resource_name="${var.project_name}-${var.environment}"
 // securty_group_name="${var.security_group}"
  security_group_name = aws_security_group.sg.id
  vpc_id=aws_vpc.main.id
  alb_dns_name=aws_lb.lasya_alb.dns_name
  subnet_id=[aws_subnet.public1.id,aws_subnet.public2.id]
}
