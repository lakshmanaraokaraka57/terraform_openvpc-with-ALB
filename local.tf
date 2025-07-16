locals {
  resource_name="${var.project_name}-${var.environment}"
 // securty_group_name="${var.security_group}"
  security_group_name = aws_security_group.sg.id
  vpc_id=aws_vpc.main.id
}
