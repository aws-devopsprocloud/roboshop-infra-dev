variable "project" {
  type = string 
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "common_tags" {
  type = map 
  default = {
    Project = "roboshop"
    Terraform = "true"
    Environment = "dev"
  }
}


variable "sg_names" {
  type = list 
  default = [
    "mongodb", 
    "redis", 
    "mysql", 
    "rabbitmq", 
    "catalogue", 
    "user", 
    "cart", 
    "shipping", 
    "payment", 
    "frontend",
    "bastion",
    "vpn",
  ]
}
# variable "sg_ingress_rules" {
#   type = list  
#   default = [
#     {
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     },
#   ]
# }
