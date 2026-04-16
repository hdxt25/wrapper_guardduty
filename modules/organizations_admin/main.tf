module "guardduty_organizations_admin_wrapper" {
  source  = "aws-ia/guardduty/aws//modules/organizations_admin"
  version = "0.1.0"

  guardduty_detector_id            = var.guardduty_detector_id
  enable_s3_protection             = var.enable_s3_protection
  enable_rds_protection            = var.enable_rds_protection
  enable_lambda_protection         = var.enable_lambda_protection
  enable_malware_protection        = var.enable_malware_protection
  enable_kubernetes_protection     = var.enable_kubernetes_protection
  enable_eks_runtime_monitoring    = var.enable_eks_runtime_monitoring
  enable_ecs_runtime_monitoring    = var.enable_ecs_runtime_monitoring
  enable_ec2_runtime_monitoring    = var.enable_ec2_runtime_monitoring
  manage_eks_addon                 = var.manage_eks_addon
  manage_ecs_agent                 = var.manage_ecs_agent
  manage_ec2_agent                 = var.manage_ec2_agent
  admin_account_id                 = var.admin_account_id
  auto_enable_org_config           = var.auto_enable_org_config
  auto_enable_organization_members = var.auto_enable_organization_members
  tags = local.tags
}