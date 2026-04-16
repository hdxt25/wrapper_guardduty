data "tfe_workspace" "current" {
  name         = local.tfe_workspace_name
  organization = var.tfe_organization
}