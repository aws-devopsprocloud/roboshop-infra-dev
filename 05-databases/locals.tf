locals {
  database_subnet_id = element(split(",", data.aws_ssm_parameter.database_subnet_ids.value), 0)
  # we are splitting the subnets id's and taking first element
}