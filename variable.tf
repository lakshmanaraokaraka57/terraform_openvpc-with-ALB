variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "project_name" {
    default="Lasya-Infotech"
  
}
variable "environment" {
    default="Dev"
  
}
variable "common_tags" {
    type=map
    default = {
        Project="Lasya-Infotech"
        Environment="Dev"
        Terraform="true"
    }
  
}
# variable "security_group" {
#     default =""
  
# }
variable "cidr_block" {
    default = ["10.0.1.0/24"]
  
}
variable "public2_cidr_block" {
    default = ["10.0.2.0/24"]
  
}
variable "private_cidr_block" {
  default=["10.0.4.0/24"]
}
