resource "aws_ssm_parameter" "security_group" {
    name="/${var.project_name}/${var.environment}/security_group_id"
    type="String"
    value=local.security_group_name
  
}

resource "aws_ssm_parameter" "vpc_id" {
    name="/${var.project_name}/${var.environment}/vpc_id"
    type="String"
    value=local.vpc_id
  
}
resource "aws_ssm_parameter" "alb_dns_name" {
    name="/${var.project_name}/${var.environment}/ALB_DNS"
    type="String"
    value=local.alb_dns_name
  
}
// public subnet Id
resource "aws_ssm_parameter" "subnet_id" {
  name = "/${var.project_name}/${var.environment}/PUB_SUB_ID"
  type = "StringList"
  value=join(",",local.subnet_id)
}
