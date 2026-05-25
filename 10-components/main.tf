module "components" {
  source = "../../terraform-components-module"
  for_each = var.components
  component = each.key 
  environment = var.environment
  rule_priority = each.value.rule_priority
  domain_name = var.domain_name
  zone_id = var.zone_id
  
}