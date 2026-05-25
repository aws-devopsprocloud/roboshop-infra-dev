# resource "aws_ssm_parameter" "mongodb_sg_id" {
#   name = "/${var.project}/${var.environment}/mongodb_sg_id"
#   type = "String" 
#   value = module.mongodb.sg_id
# }

# resource "aws_ssm_parameter" "redis_sg_id" {
#   name = "/${var.project}/${var.environment}/redis_sg_id"
#   type = "String" 
#   value = module.redis.sg_id
# }

# resource "aws_ssm_parameter" "mysql_sg_id" {
#   name = "/${var.project}/${var.environment}/mysql_sg_id"
#   type = "String" 
#   value = module.mysql.sg_id
# }

# resource "aws_ssm_parameter" "rabbitmq_sg_id" {
#   name = "/${var.project}/${var.environment}/rabbitmq_sg_id"
#   type = "String" 
#   value = module.rabbitmq.sg_id
# }

# resource "aws_ssm_parameter" "catalogue_sg_id" {
#   name = "/${var.project}/${var.environment}/catalogue_sg_id"
#   type = "String" 
#   value = module.catalogue.sg_id
# }

resource "aws_ssm_parameter" "sg_id" {
  count = length(var.sg_names)
  name = "/${var.project}/${var.environment}/${var.sg_names[count.index]}_sg_id"
  type = "String" 
  value = module.sg[count.index].sg_id
}
