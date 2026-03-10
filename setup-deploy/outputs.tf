output "role_arn" {
  description = "ARN of the GitHub deployer role."
  value       = module.deploy_bootstrap.role_arn
}

output "role_name" {
  description = "Name of the GitHub deployer role."
  value       = module.deploy_bootstrap.role_name
}

output "selected_permission_sets" {
  description = "Permission sets attached to this role."
  value       = module.deploy_bootstrap.selected_permission_sets
}

output "permission_set_policy_arns" {
  description = "Managed policy ARNs generated for selected permission sets."
  value       = module.deploy_bootstrap.permission_set_policy_arns
}

output "available_permission_sets" {
  description = "All permission sets available from the source module."
  value       = module.deploy_bootstrap.available_permission_sets
}
