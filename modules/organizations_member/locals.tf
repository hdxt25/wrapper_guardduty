locals {
  orgmember_name = format("orgmem-%s", var.product)

  # project_path = basename(path.root)
  wrapper_version = try(
    regexall("(?m)^## ([0-9]+\\.[0-9]+\\.[0-9]+)", file("${path.module}/CHANGELOG.md"))[0][0],
    null
  )
  # source_code_repo = try(
  #   trimspace(regexall("(?m)^\\s*url\\s*=\\s*(.+)$", file("${path.root}/.git/config"))[0][0]),
  #   local.project_path
  # )

  tags = merge(
    var.tags,
    {
      "ASKID"                   = var.ask_id
      "CreatedBy"               = "Terraform"
      "ComponentVersion"        = local.wrapper_version
      "environment"             = var.environment_type
      "GLCode"                  = var.gl_code
      "Division"                = var.division
      "Project_path"            = var.project_path
      "Product"                 = var.product
      "Portfolio"               = var.portfolio
      "ProductVersion"          = "1.0.0"
      "AssignmentGroup"         = var.assignment_group
      "Component"               = "Guardduty Organizations Member"
      "SourceCodeRepo"          = var.source_code_repo
      "service-tier"            = var.service_tier
      "TerraformWrapperVersion" = local.wrapper_version
      "TerraformModuleVersion"  = var.terraform_module_version
      "aide-id"                 = var.ask_id
    }
  )
}