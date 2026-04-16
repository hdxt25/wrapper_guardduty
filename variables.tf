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

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "dr_tier" {
  description = "Helps identify role of resource in disaster recovery scenarios; active: primary, actively running and serving production traffic / standby: ready-to-go but in passive state and constantly replicating data from the active resource / restoration: exist as definitions (e.g.,Terraform code) with pipelines to create them, except for backup snapshots or database instances with active replication in place"
  type        = string
  validation {
    condition     = contains(["active", "standby", "restoration"], var.dr_tier)
    error_message = "DR tier must be one of: active, standby, restoration"
  }
}

# Terraform Cloud/Enterprise Variables
variable "tfe_organization" {
  type        = string
  description = "Terraform Cloud/Enterprise organization name."
  default     = "uhg"
}

##################################################
# GuardDuty Variables
##################################################

variable "replica_region" {
  description = "Region where S3 bucket data from Amazon GuardDuty will be replicated. Defaults to `null`."
  type        = string
  default     = null
}

variable "detector_name" {
  description = "Name of the GuardDuty detector. If not provided, defaults to generated name: gdt-{product}-{prefix_region}-{environment}."
  type        = string
}

##################################################
# GuardDuty Detector
##################################################
variable "enable_guardduty" {
  description = "Enable monitoring and feedback reporting. Setting to false is equivalent to 'suspending' GuardDuty. Defaults to `true`."
  type        = bool
  default     = true
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

variable "enable_malware_protection" {
  description = "Configure and enable Malware Protection as data source for EC2 instances with findings for the detector. Defaults to `true`."
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

variable "enable_snapshot_retention" {
  description = "Enable EBS Snaptshot retention for 30 days, if any Findings exists. Defaults to `false`."
  type        = bool
  default     = false
}

variable "finding_publishing_frequency" {
  description = "Specifies the frequency of notifications sent for subsequent finding occurrences. If the detector is a GuardDuty member account, the value is determined by the GuardDuty primary account and cannot be modified. For standalone and GuardDuty primary accounts, it must be configured in Terraform to enable drift detection. Valid values for standalone and primary accounts: `FIFTEEN_MINUTES`, `ONE_HOUR`, `SIX_HOURS`. Defaults to `SIX_HOURS`."
  type        = string
  default     = "FIFTEEN_MINUTES"
}

##################################################
# GuardDuty Filter
##################################################
variable "filter_config" {
  description = <<EOF
  Specifies AWS GuardDuty Filter configuration.
  `name` - The name of the filter
  `rank` - Specifies the position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings.
  `action` - Specifies the action that is to be applied to the findings that match the filter. Can be one of ARCHIVE or NOOP.
  `criterion` - Configuration block for `finding_criteria`. Composed by `field` and one or more of the following operators: `equals` | `not_equals` | `greater_than` | `greater_than_or_equal` | `less_than` | `less_than_or_equal`.
  EOF
  type = list(object({
    name        = string
    description = optional(string)
    rank        = number
    action      = string
    criterion = list(object({
      field                 = string
      equals                = optional(list(string))
      not_equals            = optional(list(string))
      greater_than          = optional(string)
      greater_than_or_equal = optional(string)
      less_than             = optional(string)
      less_than_or_equal    = optional(string)
    }))
  }))
  default = null
}

##################################################
# GuardDuty IPSet
##################################################
variable "ipset_config" {
  description = <<EOF
  Specifies AWS GuardDuty IPSet configuration.
  `activate` - Specifies whether GuardDuty is to start using the uploaded IPSet.
  `name` - The friendly name to identify the IPSet.
  `format` - The format of the file that contains the IPSet. Valid values: `TXT` | `STIX` | `OTX_CSV` | `ALIEN_VAULT` | `PROOF_POINT` | `FIRE_EYE`.
  `content`- Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text. Example: `10.0.0.0/8\n`.
  `key` - Name of the object once it is in the bucket.
  EOF
  type = list(object({
    activate = bool
    name     = string
    format   = string
    content  = string
    key      = string
  }))
  default = null
}

##################################################
# GuardDuty ThreatIntelSet
##################################################
variable "threatintelset_config" {
  description = <<EOF
  Specifies AWS GuardDuty ThreatIntelSet configuration.
  `activate` - Specifies whether GuardDuty is to start using the uploaded ThreatIntelSet.
  `name` - The friendly name to identify the ThreatIntelSet.
  `format` - The format of the file that contains the ThreatIntelSet. Valid values: `TXT` | `STIX` | `OTX_CSV` | `ALIEN_VAULT` | `PROOF_POINT` | `FIRE_EYE`.
  `content`- Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text. Example: `10.0.0.0/8\n`.
  `key` - Name of the object once it is in the bucket.
  `object_acl`- Canned ACL to apply to the object. Valid values are `private` | `public-read` | `public-read-write` | `aws-exec-read` | `authenticated-read` | `bucket-owner-read` | `bucket-owner-full-control`.
  EOF
  type = list(object({
    activate   = bool
    name       = string
    format     = string
    content    = string
    key        = string
    object_acl = string
  }))
  default = null
}

##################################################
# GuardDuty Publishing
##################################################
variable "publish_to_s3" {
  description = "Specifies if the Amazon GuardDuty findings should be exported to S3. Defaults to `false`."
  type        = bool
  default     = false
}

variable "publishing_config" {
  description = "Defines the findings publishing configuration."
  type = list(object({
    destination_arn  = string
    kms_key_arn      = string
    destination_type = optional(string)
  }))
  default = [{
    destination_arn  = null
    kms_key_arn      = null
    destination_type = "S3"
  }]
}

variable "guardduty_s3_bucket" {
  description = "Name of the S3 Bucket for GuardDuty. Defaults to `null`."
  type        = string
  default     = null
}

variable "guardduty_bucket_acl" {
  description = "Canned ACL to apply to the bucket. Valid values are `private` | `public-read` | `public-read-write` | `aws-exec-read` | `authenticated-read` | `bucket-owner-read` | `bucket-owner-full-control`. Defaults to `null`."
  type        = string
  default     = null
}

variable "malware_resource_protection" {
  description = "List of resources to be scanned by GuardDuty Malware Protection plan."
  type        = list(string)
  default     = []
}

variable "create_malware_protection_role" {
  description = "Create a Service-linked Role for GuardDuty Malware Protection. Defaults to `false`."
  type        = bool
  default     = false
}

