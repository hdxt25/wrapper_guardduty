##################################################
# GuardDuty Detector
##################################################
output "guardduty_detector" {
  description = "AWS GuardDuty Detector."
  value       = module.guardduty_wrapper.guardduty_detector
}

##################################################
# GuardDuty Filter
##################################################
output "guardduty_filter" {
  description = "AWS GuardDuty Findings Filters definition."
  value       = module.guardduty_wrapper.guardduty_filter
}

##################################################
# GuardDuty IPSet
##################################################
output "guardduty_ipset" {
  description = "AWS GuardDuty trusted IPSet configuration."
  value       = module.guardduty_wrapper.guardduty_ipset
}

##################################################
# GuardDuty Threatintelset
##################################################
output "guardduty_threatintelset" {
  description = "AWS GuardDuty known ThreatIntelSet configuration."
  value       = module.guardduty_wrapper.guardduty_threatintelset
}

##################################################
# GuardDuty Publishing
##################################################
output "guardduty_publishing" {
  description = "AWS GuardDuty Publishing destination to export findings."
  value       = module.guardduty_wrapper.guardduty_publishing
}

output "guardduty_s3_bucket" {
  description = "Amazon S3 Bucket created for AWS GuardDuty."
  value       = module.guardduty_wrapper.guardduty_s3_bucket
}

output "guardduty_replica_bucket" {
  description = "Amazon S3 Replica Bucket created for AWS GuardDuty."
  value       = module.guardduty_wrapper.guardduty_replica_bucket
}
output "guardduty_log_bucket" {
  description = "Amazon S3 Log Bucket created for AWS GuardDuty."
  value       = module.guardduty_wrapper.guardduty_log_bucket
}

##################################################
# KMS Key
##################################################
output "guardduty_kms_key" {
  description = "Amazon KMS Key created to encrypt AWS GuardDuty's S3 Bucket."
  value       = module.guardduty_wrapper.guardduty_kms_key
}

output "guardduty_kms_replica_key" {
  description = "Amazon KMS Key created to encrypt AWS GuardDuty's S3 Replica Bucket."
  value       = module.guardduty_wrapper.guardduty_kms_replica_key
}