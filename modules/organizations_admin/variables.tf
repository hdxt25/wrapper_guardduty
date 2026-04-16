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
# GuardDuty Organizations Delegated Admin
##################################################
variable "guardduty_detector_id" {
  description = "The detector ID of the GuardDuty account."
  type        = string
}

variable "enable_s3_protection" {
  description = "Configure and enable S3 protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_rds_protection" {
  description = "Configure and enable RDS protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_lambda_protection" {
  description = "Configure and enable Lambda protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_kubernetes_protection" {
  description = "Configure and enable Kubernetes audit logs as a data source for Kubernetes protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_eks_runtime_monitoring" {
  description = "Enable Amazon EKS Runtime monitoring for all clusters. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_ecs_runtime_monitoring" {
  description = "Enable Amazon ECS Fargate Runtime monitoring for all clusters. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_ec2_runtime_monitoring" {
  description = "Enable Amazon EC2 Agent Management and Runtime monitoring. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_malware_protection" {
  description = "Configure and enable Malware Protection as data source for EC2 instances with findings for the detector. Defaults to `true`."
  type        = bool
  default     = true
}

variable "manage_eks_addon" {
  description = "Enable the management of Amazon GuardDuty Agent EKS Addon through GuardDuty. Defaults to `false`."
  type        = bool
  default     = false
}

variable "manage_ecs_agent" {
  description = "Enable the management of Amazon GuardDuty Agent for ECS through GuardDuty. Defaults to `false`."
  type        = bool
  default     = false
}

variable "manage_ec2_agent" {
  description = "Enable the management of Amazon GuardDuty Agent for EC2 through GuardDuty. Defaults to `false`."
  type        = bool
  default     = false
}

variable "admin_account_id" {
  description = "AWS Organizations Admin Account Id. Defaults to `null`"
  type        = string
  default     = null
}

variable "auto_enable_org_config" {
  description = "When this setting is enabled, all new accounts that are created in, or added to, the organization are added as a member accounts of the organization’s GuardDuty delegated administrator and GuardDuty is enabled in that AWS Region."
  type        = bool
  default     = null
}

variable "auto_enable_organization_members" {
  description = "Indicates the auto-enablement configuration of GuardDuty for the member accounts in the organization. Valid values are `ALL`, `NEW`, `NONE`. Defaults to `NEW`."
  type        = string
  default     = "NEW"
}