##########################################
# Tagging Standard Variables
##########################################

variable "environment_type" {
  description = "Deployment environment: prd, dev, stg"
  type        = string
  validation {
    condition     = contains(["dev", "stg", "prd"], var.environment_type)
    error_message = "Environment type must be one of: dev, stg, prd"
  }
}

variable "ask_id" {
  description = "AIDE identifier for the owning CCaaS platform instance"
  type        = string
  validation {
    condition = contains([
      "AIDE_0084550",
      "AIDE_0088026",
      "AIDE_0088028",
      "AIDE_0090731",
      "AIDE_0092443",
      "AIDE_0092970",
      "AIDE_0092971",
      "AIDE_0093401",
      "AIDE_0093403"
    ], var.ask_id)
    error_message = "ASKID must be a valid CCaaS platform AIDE identifier (AIDE_0084550, AIDE_0088026, AIDE_0088028, AIDE_0090731, AIDE_0092443, AIDE_0092970, AIDE_0092971, AIDE_0093401, AIDE_0093403)"
  }
}

variable "gl_code" {
  description = "General Ledger code for financial tracking"
  type        = string
}

variable "division" {
  description = "Owning CCaaS division (Platform, Routing, Recording, WFM, Desktop)"
  type        = string
  default     = "Platform"
  validation {
    condition     = contains(["Platform", "Routing", "Recording", "WFM", "Desktop"], var.division)
    error_message = "Division must be one of: Platform, Routing, Recording, WFM, Desktop"
  }
}

variable "product" {
  description = "Product name (e.g., Amazon Connect, Databridge, CRS)"
  type        = string
}

variable "portfolio" {
  description = "Product portfolio (e.g., Amazon CCaaS, Routing Apps, 3PIntegration)"
  type        = string
  default     = "CCaaS"
}

variable "assignment_group" {
  description = "ServiceNow assignment group or Splunk On-Call token, ServiceNow Group - Specific to application OmniConnect_Platform_Operations_Cloud"
  type        = string
  default     = "OmniConnect_Platform_Operations_Cloud"
}

variable "service_tier" {
  description = "Priority tier of the service: p1 (always p1 for CCaaS), p2, p3 if applicable"
  type        = string
  default     = "p1"
  validation {
    condition     = contains(["p1", "p2", "p3"], var.service_tier)
    error_message = "Service tier must be one of: p1, p2, p3"
  }
}

variable "terraform_module_version" {
  description = "Terraform Public module version"
  type        = string
  default     = "0.1.0"
}

variable "dr_tier" {
  description = "Helps identify role of resource in disaster recovery scenarios; active: primary, actively running and serving production traffic / standby: ready-to-go but in passive state and constantly replicating data from the active resource / restoration: exist as definitions (e.g.,Terraform code) with pipelines to create them, except for backup snapshots or database instances with active replication in place"
  type        = string
  validation {
    condition     = contains(["active", "standby", "restoration"], var.dr_tier)
    error_message = "DR tier must be one of: active, standby, restoration"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

# Terraform Cloud/Enterprise Variables
variable "tfe_organization" {
  type        = string
  description = "Terraform Cloud/Enterprise organization name."
  default     = "uhg"
}

##################################################
# GuardDuty Organizations Detector Member
##################################################
variable "guardduty_detector_id" {
  description = "The detector ID of the GuardDuty account. Defaults to `null`."
  type        = string
  default     = null
}

variable "master_account_id" {
  description = "AWS account ID for primary account. Defaults to `null`"
  type        = string
  default     = null
}

##################################################
# GuardDuty Organizations Member
##################################################
variable "member_config" {
  description = <<EOF
  Specifies the member account configuration:
  `enable`                     - Weather to enable GuardDuty in an Organizations Member Account. Defaults to `false`.
  `account_id`                 - The 13 digit ID number of the member account. Example: `123456789012`.
  `email`                      - Email address to send the invite for member account. Defaults to `null`.
  `invite`                     - Whether to invite the account to GuardDuty as a member. Defaults to `false`. To detect if an invitation needs to be (re-)sent, the Terraform state value is true based on a relationship_status of `Disabled` | `Enabled` |  `Invited` |  EmailVerificationInProgress.
  `invitation_message`         - Message for invitation. Defaults to `null`.
  `disable_email_notification` - Whether an email notification is sent to the accounts. Defaults to `false`.
  EOF
  type = list(object({
    enable                     = bool
    account_id                 = number
    email                      = string
    invite                     = bool
    invitation_message         = optional(string)
    disable_email_notification = optional(bool)
  }))
  default = null
}