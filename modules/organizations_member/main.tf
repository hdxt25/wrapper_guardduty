module "guardduty_organizations_member" {
  source  = "aws-ia/guardduty/aws//modules/organizations_member"
  version = "0.1.0"

  guardduty_detector_id = var.guardduty_detector_id
  master_account_id     = var.master_account_id
  member_account_id     = var.member_account_id
  member_config         = var.member_config
  tags = local.tags
}