output "available_azs" {
  value = module.roboshop.available_azs.names
}

output "default_rtb" {
  value = module.roboshop.default_rtb.route_table_id
}

