locals {
  wrapper_version = try(
    regexall("(?m)^## \\[([0-9]+\\.[0-9]+\\.[0-9]+)\\]", file("${path.module}/CHANGELOG.md"))[0][0],
    null
  )
  tfe_workspace_name = terraform.workspace
  project_path       = split("/", data.tfe_workspace.current.vcs_repo[0].identifier)[1]
  source_code_repo   = "https://github.com/${data.tfe_workspace.current.vcs_repo[0].identifier}"

  tags = merge(
    var.tags,
    {
      "ASKID"                   = var.ask_id
      "CreatedBy"               = "Terraform"
      "ComponentVersion"        = local.wrapper_version
      "environment"             = var.environment_type
      "GLCode"                  = var.gl_code
      "Division"                = var.division
      "Project_path"            = local.project_path
      "Product"                 = var.product
      "Portfolio"               = var.portfolio
      "ProductVersion"          = "1.0.0"
      "AssignmentGroup"         = var.assignment_group
      "Component"               = "Guardduty Organizations Member"
      "SourceCodeRepo"          = local.source_code_repo
      "service-tier"            = var.service_tier
      "TerraformWrapperVersion" = local.wrapper_version
      "TerraformModuleVersion"  = var.terraform_module_version
      "aide-id"                 = var.ask_id
      "dr-tier"                 = var.dr_tier
    }
  )
}