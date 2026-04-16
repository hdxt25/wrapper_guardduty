##################################################
# GuardDuty Organizations Detector Member
##################################################
output "guardduty_member_detector" {
  description = "AWS GuardDuty member detector."
  value       = module.guardduty_organizations_member.guardduty_member_detector
}

##################################################
# GuardDuty Organizations Invite
##################################################
output "guardduty_invite_accepter" {
  description = "AWS GuardDuty Detector invite."
  value       = module.guardduty_organizations_member.guardduty_invite_accepter
}

##################################################
# GuardDuty Organizations Member
##################################################
output "guardduty_member_configuration" {
  description = "AWS GuardDuty member configuration."
  value       = module.guardduty_organizations_member.guardduty_member_configuration
}