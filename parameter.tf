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