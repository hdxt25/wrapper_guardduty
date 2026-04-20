locals {
  wrapper_version-1 = try(
    regexall("(?m)^## \\[([0-9]+\\.[0-9]+\\.[0-9]+)\\]", file("${path.module}/CHANGELOG.md"))[0][0],
    null
  wrapper_version-2 = try(
    regexall("(?m)^## \\[([0-9]+\\.[0-9]+\\.[0-9]+)\\]", file("${path.module}/README.md"))[0][0],
    null
  wrapper_version-3 = try(
    regexall("(?m)^## \\[([0-9]+\\.[0-9]+\\.[0-9]+)\\]", file("${path.module}/README.md"))[0][0],
    null
  )
  )
  project_path     = coalesce(var.project_path, "unknown")
  source_code_repo = coalesce(var.source_code_repo, "unknown")

  tags_1= merge(
    var.tags,
    {
      "ASKID-1"                   = var.ask_id
      "CreatedBy-1"               = "Terraform"
      "ComponentVersion"        = local.wrapper_version
      "environment"             = var.environment_type
      "GLCode"                  = var.gl_code
      "Division"                = var.division
      "Project_path"            = local.project_path
      "Product"                 = var.product
      "Portfolio"               = var.portfolio
      "ProductVersion"          = "1.0.0"
      "AssignmentGroup"         = var.assignment_group
      "Component"               = "Guardduty"
      "source-code-repo"        = local.source_code_repo
      "service-tier"            = var.service_tier
      "TerraformWrapperVersion" = local.wrapper_version
      "TerraformModuleVersion"  = var.terraform_module_version
      "aide-id"                 = var.ask_id
      "dr-tier"                 = var.dr_tier
    }
  )

  tags_2= merge(
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
      "Component"               = "Guardduty"
      "source-code-repo"        = local.source_code_repo
      "service-tier"            = var.service_tier
      "TerraformWrapperVersion" = local.wrapper_version
      "TerraformModuleVersion"  = var.terraform_module_version
      "aide-id"                 = var.ask_id
      "dr-tier"                 = var.dr_tier
    }
  )

locals {
  wrapper_version = try(
    regexall("(?m)^## \\[([0-9]+\\.[0-9]+\\.[0-9]+)\\]", file("${path.module}/CHANGELOG.md"))[0][0],
    null
  )
}
