##################################################
# GuardDuty Organizations Delegated Admin
##################################################
output "guardduty_delegated_admin_account" {
  description = "AWS GuardDuty Delegated Admin account."
  value       = module.guardduty_organizations_admin_wrapper.guardduty_delegated_admin_account
}

output "guardduty_organization_configuration" {
  description = "AWS GuardDuty Organizations configuration."
  value       = module.guardduty_organizations_admin_wrapper.guardduty_organization_configuration
}